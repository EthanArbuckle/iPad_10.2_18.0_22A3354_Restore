@implementation GCHapticActuator

- (GCHapticActuator)initWithLabel:(id)a3 type:(int64_t)a4 index:(unint64_t)a5
{
  id v9;
  GCHapticActuator *v10;
  GCHapticActuator *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCHapticActuator;
  v10 = -[GCHapticActuator init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_label, a3);
    v11->_type = a4;
    v11->_index = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GCHapticActuator *v4;
  void *v5;
  void *v6;
  GCHapticActuator *v7;

  v4 = [GCHapticActuator alloc];
  -[GCHapticActuator label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[GCHapticActuator initWithLabel:type:index:](v4, "initWithLabel:type:index:", v6, -[GCHapticActuator type](self, "type"), -[GCHapticActuator index](self, "index"));

  return v7;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %@ (type %ld)>"), objc_opt_class(), self->_label, self->_type);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GCHapticActuator label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("label"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[GCHapticActuator type](self, "type"), CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[GCHapticActuator index](self, "index"), CFSTR("index"));

}

- (GCHapticActuator)initWithCoder:(id)a3
{
  id v4;
  GCHapticActuator *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCHapticActuator;
  v5 = -[GCHapticActuator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("index"));
  }

  return v5;
}

- (GCHapticActuator)initWithJSONDictionaryRepresentation:(id)a3
{
  id v4;
  GCHapticActuator *v5;
  uint64_t v6;
  NSString *label;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCHapticActuator;
  v5 = -[GCHapticActuator init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_index = objc_msgSend(v9, "unsignedIntValue");

  }
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  int64_t type;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  type = self->_type;
  v9[0] = self->_label;
  v8[0] = CFSTR("label");
  v8[1] = CFSTR("type");
  +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:", type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("index");
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", self->_index);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
