@implementation VN3XKGTKNBvy6h4RFtpxLyW

- (VN3XKGTKNBvy6h4RFtpxLyW)initWithOriginatingRequestSpecifier:(id)a3 imageSignatureprint:(id)a4 imageSignatureHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  VN3XKGTKNBvy6h4RFtpxLyW *v11;
  uint64_t v12;
  VN6Ac6Cyl5O5oK19HboyMBR *imageSignatureprint;
  uint64_t v14;
  VN6B8mkraBUpwUqskMYPtS3 *imageSignatureHash;
  VN3XKGTKNBvy6h4RFtpxLyW *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  v11 = -[VNObservation initWithOriginatingRequestSpecifier:](&v18, sel_initWithOriginatingRequestSpecifier_, v8);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    imageSignatureprint = v11->_imageSignatureprint;
    v11->_imageSignatureprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v12;

    v14 = objc_msgSend(v10, "copy");
    imageSignatureHash = v11->_imageSignatureHash;
    v11->_imageSignatureHash = (VN6B8mkraBUpwUqskMYPtS3 *)v14;

    v16 = v11;
  }

  return v11;
}

- (VN3XKGTKNBvy6h4RFtpxLyW)initWithCoder:(id)a3
{
  id v4;
  VN3XKGTKNBvy6h4RFtpxLyW *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VN3XKGTKNBvy6h4RFtpxLyW *v9;
  uint64_t v10;
  VN6Ac6Cyl5O5oK19HboyMBR *imageSignatureprint;
  uint64_t v12;
  VN6B8mkraBUpwUqskMYPtS3 *imageSignatureHash;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  v5 = -[VNObservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNImageHashSignatureObservation"));
    if (!(_DWORD)v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sgnPrnt"));
      v10 = objc_claimAutoreleasedReturnValue();
      imageSignatureprint = v5->_imageSignatureprint;
      v5->_imageSignatureprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sgnHash"));
      v12 = objc_claimAutoreleasedReturnValue();
      imageSignatureHash = v5->_imageSignatureHash;
      v5->_imageSignatureHash = (VN6B8mkraBUpwUqskMYPtS3 *)v12;

      v9 = v5;
      goto LABEL_6;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   objc_opt_class(),
                   0,
                   v6);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);

  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNImageHashSignatureObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageSignatureprint, CFSTR("sgnPrnt"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageSignatureHash, CFSTR("sgnHash"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  -[VNObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VN6Ac6Cyl5O5oK19HboyMBR copy](self->_imageSignatureprint, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

    v6 = -[VN6B8mkraBUpwUqskMYPtS3 copy](self->_imageSignatureHash, "copy");
    v7 = (void *)v3[13];
    v3[13] = v6;

  }
  return v3;
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
  v9.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureprint](self, "imageSignatureprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureHash](self, "imageSignatureHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VN3XKGTKNBvy6h4RFtpxLyW *v4;
  VN3XKGTKNBvy6h4RFtpxLyW *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (VN3XKGTKNBvy6h4RFtpxLyW *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
    if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureprint](self, "imageSignatureprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureprint](v5, "imageSignatureprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureHash](self, "imageSignatureHash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VN3XKGTKNBvy6h4RFtpxLyW imageSignatureHash](v5, "imageSignatureHash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

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

- (VN6Ac6Cyl5O5oK19HboyMBR)imageSignatureprint
{
  return (VN6Ac6Cyl5O5oK19HboyMBR *)objc_getProperty(self, a2, 96, 1);
}

- (VN6B8mkraBUpwUqskMYPtS3)imageSignatureHash
{
  return (VN6B8mkraBUpwUqskMYPtS3 *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSignatureHash, 0);
  objc_storeStrong((id *)&self->_imageSignatureprint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
