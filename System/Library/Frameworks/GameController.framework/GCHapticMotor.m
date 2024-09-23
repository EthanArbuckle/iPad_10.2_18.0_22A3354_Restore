@implementation GCHapticMotor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5 frequency:(float)a6 amplitude:(float)a7
{
  id v13;
  GCHapticMotor *v14;
  GCHapticMotor *v15;
  uint64_t v16;
  NSMutableArray *queuedTransients;
  objc_super v19;

  v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCHapticMotor;
  v14 = -[GCHapticMotor init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_index = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_features = a5;
    v15->_frequency = a6;
    v15->_amplitude = a7;
    +[NSMutableArray array](&off_254DEBB20, "array");
    v16 = objc_claimAutoreleasedReturnValue();
    queuedTransients = v15->_queuedTransients;
    v15->_queuedTransients = (NSMutableArray *)v16;

  }
  return v15;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5
{
  double v5;
  double v6;

  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  return -[GCHapticMotor initWithIndex:name:features:frequency:amplitude:](self, "initWithIndex:name:features:frequency:amplitude:", *(_QWORD *)&a3, a4, a5, v5, v6);
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4
{
  return -[GCHapticMotor initWithIndex:name:features:](self, "initWithIndex:name:features:", *(_QWORD *)&a3, a4, 0);
}

- (GCHapticMotor)initWithIndex:(int)a3
{
  return -[GCHapticMotor initWithIndex:name:features:](self, "initWithIndex:name:features:", *(_QWORD *)&a3, 0, 0);
}

- (GCHapticMotor)init
{
  return -[GCHapticMotor initWithIndex:](self, "initWithIndex:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t index;
  double v5;
  double v6;
  id v7;

  index = self->_index;
  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", index, CFSTR("_index"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_features, CFSTR("_features"));
  *(float *)&v5 = self->_frequency;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("_frequency"), v5);
  *(float *)&v6 = self->_amplitude;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("_amplitude"), v6);

}

- (GCHapticMotor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  GCHapticMotor *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_index"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_features"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_frequency"));
  v9 = v8;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_amplitude"));
  v11 = v10;

  LODWORD(v12) = v9;
  LODWORD(v13) = v11;
  v14 = -[GCHapticMotor initWithIndex:name:features:frequency:amplitude:](self, "initWithIndex:name:features:frequency:amplitude:", v5, v6, v7, v12, v13);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[GCHapticMotor name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v7;

    *(_DWORD *)(v5 + 8) = -[GCHapticMotor index](self, "index");
    *(_QWORD *)(v5 + 32) = -[GCHapticMotor features](self, "features");
    -[GCHapticMotor frequency](self, "frequency");
    *(_DWORD *)(v5 + 12) = v9;
    -[GCHapticMotor amplitude](self, "amplitude");
    *(_DWORD *)(v5 + 16) = v10;
  }
  return (id)v5;
}

- (void)applyValuesFrom:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "frequency");
  -[GCHapticMotor setFrequency:](self, "setFrequency:");
  if ((-[GCHapticMotor features](self, "features") & 1) != 0)
  {
    objc_msgSend(v4, "amplitude");
    -[GCHapticMotor setAmplitude:](self, "setAmplitude:");
  }

}

- (void)enqueueHapticTransientEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[GCHapticMotor features](self, "features") & 2) != 0 && objc_msgSend(v4, "type") == 1)
    -[NSMutableArray addObject:](self->_queuedTransients, "addObject:", v4);

}

- (void)drainQueuedTransients
{
  -[NSMutableArray removeAllObjects](self->_queuedTransients, "removeAllObjects");
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("GCHapticMotor - %@(%d) f=%f a=%f"), self->_name, self->_index, self->_frequency, self->_amplitude);
}

- (NSString)name
{
  return self->_name;
}

- (int)index
{
  return self->_index;
}

- (unint64_t)features
{
  return self->_features;
}

- (float)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(float)a3
{
  self->_frequency = a3;
}

- (float)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(float)a3
{
  self->_amplitude = a3;
}

- (NSMutableArray)queuedTransients
{
  return self->_queuedTransients;
}

- (void)setQueuedTransients:(id)a3
{
  objc_storeStrong((id *)&self->_queuedTransients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTransients, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
