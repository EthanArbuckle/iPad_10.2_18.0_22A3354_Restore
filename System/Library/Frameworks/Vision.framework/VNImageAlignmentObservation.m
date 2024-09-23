@implementation VNImageAlignmentObservation

- (VNImageAlignmentObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageAlignmentObservation *v5;
  uint64_t v6;
  VNImageRegistrationSignature *referenceImageSignature;
  uint64_t v8;
  VNImageRegistrationSignature *floatingImageSignature;
  VNImageAlignmentObservation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNImageAlignmentObservation;
  v5 = -[VNObservation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceImageSignature"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceImageSignature = v5->_referenceImageSignature;
    v5->_referenceImageSignature = (VNImageRegistrationSignature *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floatingImageSignature"));
    v8 = objc_claimAutoreleasedReturnValue();
    floatingImageSignature = v5->_floatingImageSignature;
    v5->_floatingImageSignature = (VNImageRegistrationSignature *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageAlignmentObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceImageSignature, CFSTR("referenceImageSignature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_floatingImageSignature, CFSTR("floatingImageSignature"));

}

- (id)vn_cloneObject
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageAlignmentObservation;
  -[VNObservation vn_cloneObject](&v6, sel_vn_cloneObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setReferenceImageSignature:", self->_referenceImageSignature);
    objc_msgSend(v4, "setFloatingImageSignature:", self->_floatingImageSignature);
  }
  return v4;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNImageAlignmentObservation;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VNImageAlignmentObservation referenceImageSignature](self, "referenceImageSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VNImageAlignmentObservation floatingImageSignature](self, "floatingImageSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNImageAlignmentObservation *v4;
  VNImageAlignmentObservation *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (VNImageAlignmentObservation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNImageAlignmentObservation;
    if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageAlignmentObservation referenceImageSignature](self, "referenceImageSignature");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageAlignmentObservation referenceImageSignature](v5, "referenceImageSignature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0)
      {
        -[VNImageAlignmentObservation floatingImageSignature](self, "floatingImageSignature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNImageAlignmentObservation floatingImageSignature](v5, "floatingImageSignature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (CGAffineTransform)alignmentTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (void)setAlignmentTransform:(CGAffineTransform *)a3
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0CB2FA8], CFSTR("%@ is not supported by %@"), v6, v5);

}

- (VNImageRegistrationSignature)referenceImageSignature
{
  return self->_referenceImageSignature;
}

- (void)setReferenceImageSignature:(id)a3
{
  objc_storeStrong((id *)&self->_referenceImageSignature, a3);
}

- (VNImageRegistrationSignature)floatingImageSignature
{
  return self->_floatingImageSignature;
}

- (void)setFloatingImageSignature:(id)a3
{
  objc_storeStrong((id *)&self->_floatingImageSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingImageSignature, 0);
  objc_storeStrong((id *)&self->_referenceImageSignature, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
