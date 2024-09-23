@implementation VNImageTranslationAlignmentObservation

- (VNImageTranslationAlignmentObservation)init
{
  VNImageTranslationAlignmentObservation *v2;
  VNImageTranslationAlignmentObservation *v3;
  __int128 v4;
  __int128 v5;
  VNImageTranslationAlignmentObservation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNImageTranslationAlignmentObservation;
  v2 = -[VNObservation init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v2->_alignmentTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_alignmentTransform.c = v5;
    *(_OWORD *)&v2->_alignmentTransform.tx = v4;
    v6 = v2;
  }

  return v3;
}

- (VNImageTranslationAlignmentObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageTranslationAlignmentObservation *v5;
  VNImageTranslationAlignmentObservation *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNImageTranslationAlignmentObservation;
  v5 = -[VNImageAlignmentObservation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "vn_decodeCGAffineTransformForKey:", CFSTR("alignmentTransform"));
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    *(_OWORD *)&v5->_alignmentTransform.a = v8;
    *(_OWORD *)&v5->_alignmentTransform.c = v9;
    *(_OWORD *)&v5->_alignmentTransform.tx = v10;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNImageTranslationAlignmentObservation;
  -[VNImageAlignmentObservation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = *(_OWORD *)&self->_alignmentTransform.c;
  v6[0] = *(_OWORD *)&self->_alignmentTransform.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_alignmentTransform.tx;
  objc_msgSend(v4, "vn_encodeCGAffineTransform:forKey:", v6, CFSTR("alignmentTransform"));

}

- (id)vn_cloneObject
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageTranslationAlignmentObservation;
  -[VNImageAlignmentObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = *(_OWORD *)&self->_alignmentTransform.c;
    v4 = *(_OWORD *)&self->_alignmentTransform.tx;
    v3[7] = *(_OWORD *)&self->_alignmentTransform.a;
    v3[8] = v5;
    v3[9] = v4;
  }
  return v3;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageTranslationAlignmentObservation;
  v3 = -[VNImageAlignmentObservation hash](&v6, sel_hash);
  -[VNImageTranslationAlignmentObservation alignmentTransform](self, "alignmentTransform");
  return VNHashCGAffineTransform((uint64_t)&v5) ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNImageTranslationAlignmentObservation *v4;
  VNImageTranslationAlignmentObservation *v5;
  BOOL v6;
  CGAffineTransform v8;
  CGAffineTransform t1;
  objc_super v10;

  v4 = (VNImageTranslationAlignmentObservation *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageTranslationAlignmentObservation;
    if (-[VNImageAlignmentObservation isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageTranslationAlignmentObservation alignmentTransform](self, "alignmentTransform");
      if (v5)
        -[VNImageTranslationAlignmentObservation alignmentTransform](v5, "alignmentTransform");
      else
        memset(&v8, 0, sizeof(v8));
      v6 = CGAffineTransformEqualToTransform(&t1, &v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)VNImageTranslationAlignmentObservation;
  -[VNObservation description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageTranslationAlignmentObservation alignmentTransform](self, "alignmentTransform");
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%g %g %g %g %g %g]"), v9, v10, v11, v12);
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v6);

  return v7;
}

- (CGAffineTransform)alignmentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setAlignmentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_alignmentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_alignmentTransform.c = v4;
  *(_OWORD *)&self->_alignmentTransform.tx = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNTranslationalImageRegistrationRequest");
}

- (CGAffineTransform)alignmentTransformInTopLeftOrigin:(SEL)a3 orientation:(BOOL)a4
{
  _BOOL4 v6;
  __int128 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  -[VNImageTranslationAlignmentObservation alignmentTransform](self, "alignmentTransform");
  v8 = v15;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  VNAffineTransformForVisionToTopLeftOriginOrientation(v6, a5, (uint64_t)&v10);
  return CGAffineTransformMakeTranslation(retstr, *(double *)&v12 + *((double *)&v8 + 1) * *(double *)&v11 + *(double *)&v10 * *(double *)&v8, *((double *)&v12 + 1) + *((double *)&v8 + 1) * *((double *)&v11 + 1) + *((double *)&v10 + 1) * *(double *)&v8);
}

@end
