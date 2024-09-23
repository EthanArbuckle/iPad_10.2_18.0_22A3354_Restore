@implementation MADMultiModalInputFaceprintSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputFaceprintSegment)initWithFaceprint:(id)a3
{
  id v5;
  MADMultiModalInputFaceprintSegment *v6;
  MADMultiModalInputFaceprintSegment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMultiModalInputFaceprintSegment;
  v6 = -[MADMultiModalInputFaceprintSegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_faceprint, a3);

  return v7;
}

- (MADMultiModalInputFaceprintSegment)initWithCoder:(id)a3
{
  id v4;
  MADMultiModalInputFaceprintSegment *v5;
  void *v6;
  id v7;
  uint64_t v8;
  VNFaceprint *faceprint;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputFaceprintSegment;
  v5 = -[MADMultiModalInputSegment initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getVNFaceprintClass_softClass;
    v16 = getVNFaceprintClass_softClass;
    if (!getVNFaceprintClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getVNFaceprintClass_block_invoke;
      v12[3] = &unk_1E97E2300;
      v12[4] = &v13;
      __getVNFaceprintClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Faceprint"));
    v8 = objc_claimAutoreleasedReturnValue();
    faceprint = v5->_faceprint;
    v5->_faceprint = (VNFaceprint *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputFaceprintSegment;
  v4 = a3;
  -[MADMultiModalInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprint, CFSTR("Faceprint"), v5.receiver, v5.super_class);

}

- (int64_t)type
{
  return 5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("faceprint: %@"), self->_faceprint);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (VNFaceprint)faceprint
{
  return self->_faceprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
}

@end
