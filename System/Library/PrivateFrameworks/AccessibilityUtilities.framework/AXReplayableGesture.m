@implementation AXReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tapGestureForInterfaceOrientedPoint:(CGPoint)a3
{
  AXMutableReplayableGesture *v3;
  void *v4;
  void *v5;
  void *v6;
  CGPoint v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v3 = objc_alloc_init(AXMutableReplayableGesture);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v8, "{CGPoint=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1E24F8120;
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_1E24F8120;
  v10 = &unk_1E24F9150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMutableReplayableGesture addPointsByFingerIdentifier:forces:atTime:](v3, "addPointsByFingerIdentifier:forces:atTime:", v5, v6, 0.0);

  -[AXMutableReplayableGesture addPointsByFingerIdentifier:forces:atTime:](v3, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], 0.1);
  return v3;
}

- (unint64_t)numberOfEvents
{
  return -[NSArray count](self->_allEvents, "count");
}

- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_allEvents, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Fingers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)timeAtEventIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSArray objectAtIndexedSubscript:](self->_allEvents, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  unint64_t v13;
  double v14;
  double v15;
  CGPoint result;

  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_allEvents, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Fingers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = v6;
    v13 = a4;
    _AXAssert();
  }
  v14 = 0.0;
  v15 = 0.0;
  objc_msgSend(v9, "getValue:size:", &v14, 16, v12, v13);

  v10 = v14;
  v11 = v15;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  NSArray *allEvents;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;

  allEvents = self->_allEvents;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](allEvents, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Forces"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXReplayableGesture;
  -[AXReplayableGesture description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - device relative: %i, data: %@"), -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative"), self->_allEvents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *allEvents;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    allEvents = self->_allEvents;
    if (allEvents == (NSArray *)v5[1] || -[NSArray isEqualToArray:](allEvents, "isEqualToArray:"))
    {
      v7 = -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative");
      v8 = v7 ^ objc_msgSend(v5, "arePointsDeviceRelative") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_allEvents, "hash");
  return v3 ^ -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative");
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *allEvents;
  id v5;

  allEvents = self->_allEvents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", allEvents, CFSTR("AllEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", &unk_1E24F8138, CFSTR("Version"));
  objc_msgSend(v5, "encodeBool:forKey:", -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative"), CFSTR("ArePointsDeviceRelative"));

}

- (AXReplayableGesture)initWithCoder:(id)a3
{
  id v4;
  AXReplayableGesture *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *allEvents;
  objc_super v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXReplayableGesture;
  v5 = -[AXReplayableGesture init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AllEvents"));
    v9 = objc_claimAutoreleasedReturnValue();
    allEvents = v5->_allEvents;
    v5->_allEvents = (NSArray *)v9;

    -[AXReplayableGesture setArePointsDeviceRelative:](v5, "setArePointsDeviceRelative:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ArePointsDeviceRelative")));
  }

  return v5;
}

- (BOOL)arePointsDeviceRelative
{
  return self->_arePointsDeviceRelative;
}

- (void)setArePointsDeviceRelative:(BOOL)a3
{
  self->_arePointsDeviceRelative = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEvents, 0);
}

@end
