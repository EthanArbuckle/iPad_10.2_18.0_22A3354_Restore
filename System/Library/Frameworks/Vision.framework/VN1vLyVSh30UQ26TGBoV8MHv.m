@implementation VN1vLyVSh30UQ26TGBoV8MHv

- (VN1vLyVSh30UQ26TGBoV8MHv)initWithOriginatingRequestSpecifier:(id)a3 adjustments:(id)a4
{
  id v6;
  VN1vLyVSh30UQ26TGBoV8MHv *v7;
  uint64_t v8;
  NSDictionary *adjustments;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  v7 = -[VNObservation initWithOriginatingRequestSpecifier:](&v11, sel_initWithOriginatingRequestSpecifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v6, 1);
    adjustments = v7->_adjustments;
    v7->_adjustments = (NSDictionary *)v8;

  }
  return v7;
}

- (NSArray)adjustmentKeys
{
  return -[NSDictionary allKeys](self->_adjustments, "allKeys");
}

- (BOOL)hasAdjustmentForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKey:](self->_adjustments, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)adjustmentValuesForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_adjustments, "objectForKey:", a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  return -[NSDictionary hash](self->_adjustments, "hash") ^ __ROR8__(-[VNObservation hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VN1vLyVSh30UQ26TGBoV8MHv *v4;
  BOOL v5;

  v4 = (VN1vLyVSh30UQ26TGBoV8MHv *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_adjustments, "isEqualToDictionary:", v4->_adjustments);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  -[VNObservation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VN1vLyVSh30UQ26TGBoV8MHv adjustmentKeys](self, "adjustmentKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSDictionary copy](self->_adjustments, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

  }
  return v3;
}

- (VN1vLyVSh30UQ26TGBoV8MHv)initWithCoder:(id)a3
{
  id v4;
  VN1vLyVSh30UQ26TGBoV8MHv *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *adjustments;
  NSDictionary *v12;
  VN1vLyVSh30UQ26TGBoV8MHv *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  v5 = -[VNObservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("adjustments"));
  v10 = objc_claimAutoreleasedReturnValue();
  adjustments = v5->_adjustments;
  v5->_adjustments = (NSDictionary *)v10;

  v12 = v5->_adjustments;
  if (!v12)
    v13 = 0;
  else
LABEL_3:
    v13 = v5;

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  v4 = a3;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_adjustments, CFSTR("adjustments"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
