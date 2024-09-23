@implementation GCDevicePhysicalInputDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputDirectionPadElementDescription)init
{
  GCDevicePhysicalInputDirectionPadElementDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  result = -[GCDevicePhysicalInputElementDescription init](&v3, sel_init);
  result->_eventUpValueField = -1;
  result->_eventDownValueField = -1;
  result->_eventLeftValueField = -1;
  result->_eventRightValueField = -1;
  return result;
}

- (GCDevicePhysicalInputDirectionPadElementDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputDirectionPadElementDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *xySources;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *xSources;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *ySources;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *upSources;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *leftSources;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *downSources;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *rightSources;
  uint64_t v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputElementDescription initWithCoder:](&v35, sel_initWithCoder_, v3);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v35.receiver, v35.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("xySources"));
  v7 = objc_claimAutoreleasedReturnValue();
  xySources = v4->_xySources;
  v4->_xySources = (NSArray *)v7;

  v9 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("xSources"));
  v11 = objc_claimAutoreleasedReturnValue();
  xSources = v4->_xSources;
  v4->_xSources = (NSArray *)v11;

  v13 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("ySources"));
  v15 = objc_claimAutoreleasedReturnValue();
  ySources = v4->_ySources;
  v4->_ySources = (NSArray *)v15;

  v17 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("upSources"));
  v19 = objc_claimAutoreleasedReturnValue();
  upSources = v4->_upSources;
  v4->_upSources = (NSArray *)v19;

  v21 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, CFSTR("leftSources"));
  v23 = objc_claimAutoreleasedReturnValue();
  leftSources = v4->_leftSources;
  v4->_leftSources = (NSArray *)v23;

  v25 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("downSources"));
  v27 = objc_claimAutoreleasedReturnValue();
  downSources = v4->_downSources;
  v4->_downSources = (NSArray *)v27;

  v29 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v30, CFSTR("rightSources"));
  v31 = objc_claimAutoreleasedReturnValue();
  rightSources = v4->_rightSources;
  v4->_rightSources = (NSArray *)v31;

  v4->_analog = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("analog"));
  v4->_eventUpValueField = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventUpValueField"));
  v4->_eventDownValueField = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventDownValueField"));
  v4->_eventLeftValueField = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventLeftValueField"));
  v33 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("eventRightValueField"));

  v4->_eventRightValueField = v33;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  v4 = a3;
  -[GCDevicePhysicalInputElementDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_xySources, CFSTR("xySources"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_xSources, CFSTR("xSources"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ySources, CFSTR("ySources"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_upSources, CFSTR("upSources"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_leftSources, CFSTR("leftSources"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_downSources, CFSTR("downSources"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rightSources, CFSTR("rightSources"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_analog, CFSTR("analog"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventUpValueField, CFSTR("eventUpValueField"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventDownValueField, CFSTR("eventDownValueField"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventLeftValueField, CFSTR("eventLeftValueField"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventRightValueField, CFSTR("eventRightValueField"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  v4 = -[GCDevicePhysicalInputElementDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 7, self->_xySources);
  objc_storeStrong(v4 + 8, self->_xSources);
  objc_storeStrong(v4 + 9, self->_ySources);
  objc_storeStrong(v4 + 10, self->_upSources);
  objc_storeStrong(v4 + 11, self->_leftSources);
  objc_storeStrong(v4 + 12, self->_downSources);
  objc_storeStrong(v4 + 13, self->_rightSources);
  *((_BYTE *)v4 + 48) = self->_analog;
  v4[14] = (id)self->_eventUpValueField;
  v4[15] = (id)self->_eventDownValueField;
  v4[16] = (id)self->_eventLeftValueField;
  v4[17] = (id)self->_eventRightValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSArray **v4;
  NSArray *xySources;
  NSArray *xSources;
  NSArray *ySources;
  NSArray *upSources;
  NSArray *leftSources;
  NSArray *downSources;
  NSArray *rightSources;
  BOOL v12;
  objc_super v14;

  v4 = (NSArray **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  v14.receiver = self;
  v14.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  if (!-[GCDevicePhysicalInputElementDescription isEqual:](&v14, sel_isEqual_, v4))
    goto LABEL_22;
  xySources = self->_xySources;
  if (xySources != v4[7] && !-[NSArray isEqual:](xySources, "isEqual:"))
    goto LABEL_22;
  if (((xSources = self->_xSources, xSources == v4[8]) || -[NSArray isEqual:](xSources, "isEqual:"))
    && ((ySources = self->_ySources, ySources == v4[9]) || -[NSArray isEqual:](ySources, "isEqual:"))
    && ((upSources = self->_upSources, upSources == v4[10]) || -[NSArray isEqual:](upSources, "isEqual:"))
    && ((leftSources = self->_leftSources, leftSources == v4[11])
     || -[NSArray isEqual:](leftSources, "isEqual:"))
    && ((downSources = self->_downSources, downSources == v4[12])
     || -[NSArray isEqual:](downSources, "isEqual:"))
    && ((rightSources = self->_rightSources, rightSources == v4[13])
     || -[NSArray isEqual:](rightSources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 48)
    && (NSArray *)self->_eventUpValueField == v4[14]
    && (NSArray *)self->_eventDownValueField == v4[15]
    && (NSArray *)self->_eventLeftValueField == v4[16])
  {
    v12 = self->_eventRightValueField == (_QWORD)v4[17];
  }
  else
  {
LABEL_22:
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  -[GCDevicePhysicalInputElementDescription description](&v8, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_analog)
    v5 = CFSTR("analog");
  else
    v5 = CFSTR("digital");
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Direction Pad %@ %@ ⬆%#zx ➡%#zx ⬇%#zx ⬅%#zx"), v3, v5, self->_eventUpValueField, self->_eventRightValueField, self->_eventDownValueField, self->_eventLeftValueField);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)xySources
{
  return self->_xySources;
}

- (void)setXySources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)xSources
{
  return self->_xSources;
}

- (void)setXSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)ySources
{
  return self->_ySources;
}

- (void)setYSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)upSources
{
  return self->_upSources;
}

- (void)setUpSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)leftSources
{
  return self->_leftSources;
}

- (void)setLeftSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)downSources
{
  return self->_downSources;
}

- (void)setDownSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)rightSources
{
  return self->_rightSources;
}

- (void)setRightSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(BOOL)a3
{
  self->_analog = a3;
}

- (unint64_t)eventUpValueField
{
  return self->_eventUpValueField;
}

- (void)setEventUpValueField:(unint64_t)a3
{
  self->_eventUpValueField = a3;
}

- (unint64_t)eventDownValueField
{
  return self->_eventDownValueField;
}

- (void)setEventDownValueField:(unint64_t)a3
{
  self->_eventDownValueField = a3;
}

- (unint64_t)eventLeftValueField
{
  return self->_eventLeftValueField;
}

- (void)setEventLeftValueField:(unint64_t)a3
{
  self->_eventLeftValueField = a3;
}

- (unint64_t)eventRightValueField
{
  return self->_eventRightValueField;
}

- (void)setEventRightValueField:(unint64_t)a3
{
  self->_eventRightValueField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSources, 0);
  objc_storeStrong((id *)&self->_downSources, 0);
  objc_storeStrong((id *)&self->_leftSources, 0);
  objc_storeStrong((id *)&self->_upSources, 0);
  objc_storeStrong((id *)&self->_ySources, 0);
  objc_storeStrong((id *)&self->_xSources, 0);
  objc_storeStrong((id *)&self->_xySources, 0);
}

@end
