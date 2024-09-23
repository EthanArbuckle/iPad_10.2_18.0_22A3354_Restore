@implementation BCSVisualCodeAppClip

- (BCSVisualCodeAppClip)initWithPayloadString:(id)a3 version:(unint64_t)a4
{
  id v6;
  BCSVisualCodeAppClip *v7;
  uint64_t v8;
  NSString *payloadString;
  BCSVisualCodeAppClip *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSVisualCodeAppClip;
  v7 = -[BCSVisualCodeAppClip init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    payloadString = v7->_payloadString;
    v7->_payloadString = (NSString *)v8;

    v7->_codeVersion = a4;
    v10 = v7;
  }

  return v7;
}

- (BCSVisualCodeAppClip)initWithRawPayload:(id)a3 version:(unint64_t)a4
{
  id v6;
  BCSVisualCodeAppClip *v7;
  uint64_t v8;
  NSData *rawDataPayload;
  BCSVisualCodeAppClip *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSVisualCodeAppClip;
  v7 = -[BCSVisualCodeAppClip init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    rawDataPayload = v7->_rawDataPayload;
    v7->_rawDataPayload = (NSData *)v8;

    v7->_codeVersion = a4;
    v10 = v7;
  }

  return v7;
}

- (id)payloadString
{
  return self->_payloadString;
}

- (unint64_t)codeVersion
{
  return self->_codeVersion;
}

- (int64_t)codeType
{
  return 1;
}

- (id)rawPayload
{
  return self->_rawDataPayload;
}

- (CGRect)boundingBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BYTE v22[16];
  uint64_t v23;
  _QWORD v24[6];
  CGRect result;

  v24[5] = *MEMORY[0x24BDAC8D0];
  -[BCSVisualCode topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[BCSVisualCode topRight](self, "topRight");
  v23 = v7;
  v24[0] = v8;
  -[BCSVisualCode bottomLeft](self, "bottomLeft");
  v24[1] = v9;
  v24[2] = v10;
  -[BCSVisualCode bottomRight](self, "bottomRight");
  v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  v14 = v4;
  v15 = v6;
  do
  {
    v16 = *(double *)&v22[v11 * 8 + 16];
    v17 = *(double *)&v24[v11];
    if (v4 >= v16)
      v4 = *(double *)&v22[v11 * 8 + 16];
    if (v14 < v16)
      v14 = *(double *)&v22[v11 * 8 + 16];
    if (v6 >= v17)
      v6 = *(double *)&v24[v11];
    if (v15 < v17)
      v15 = *(double *)&v24[v11];
    v11 += 2;
  }
  while (v11 != 6);
  v18 = v14 - v4;
  v19 = v15 - v6;
  v20 = v4;
  v21 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *payloadString;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  payloadString = self->_payloadString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payloadString, CFSTR("payloadString"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_codeVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("codeVersion"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_rawDataPayload, CFSTR("rawDataPayload"));
  v7 = (void *)MEMORY[0x24BDD1968];
  -[BCSVisualCode topLeft](self, "topLeft");
  v26[0] = v8;
  v26[1] = v9;
  objc_msgSend(v7, "valueWithBytes:objCType:", v26, "{CGPoint=dd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("topLeft"));

  v11 = (void *)MEMORY[0x24BDD1968];
  -[BCSVisualCode topRight](self, "topRight");
  v25[0] = v12;
  v25[1] = v13;
  objc_msgSend(v11, "valueWithBytes:objCType:", v25, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("topRight"));

  v15 = (void *)MEMORY[0x24BDD1968];
  -[BCSVisualCode bottomRight](self, "bottomRight");
  v24[0] = v16;
  v24[1] = v17;
  objc_msgSend(v15, "valueWithBytes:objCType:", v24, "{CGPoint=dd}");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("bottomRight"));

  v19 = (void *)MEMORY[0x24BDD1968];
  -[BCSVisualCode bottomLeft](self, "bottomLeft");
  v23[0] = v20;
  v23[1] = v21;
  objc_msgSend(v19, "valueWithBytes:objCType:", v23, "{CGPoint=dd}");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("bottomLeft"));

}

- (BCSVisualCodeAppClip)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BCSVisualCodeAppClip *v7;
  void *v8;
  BCSVisualCodeAppClip *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codeVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[BCSVisualCodeAppClip initWithPayloadString:version:]([BCSVisualCodeAppClip alloc], "initWithPayloadString:version:", v6, objc_msgSend(v5, "unsignedIntegerValue"));
  else
    v7 = 0;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawDataPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[BCSVisualCodeAppClip initWithRawPayload:version:]([BCSVisualCodeAppClip alloc], "initWithRawPayload:version:", v8, objc_msgSend(v5, "unsignedIntegerValue"));

    v7 = v9;
  }
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topLeft"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGPointValue");
  -[BCSVisualCode setTopLeft:](v7, "setTopLeft:");

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topRight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGPointValue");
  -[BCSVisualCode setTopRight:](v7, "setTopRight:");

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bottomRight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CGPointValue");
  -[BCSVisualCode setBottomRight:](v7, "setBottomRight:");

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bottomLeft"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CGPointValue");
  -[BCSVisualCode setBottomLeft:](v7, "setBottomLeft:");

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDataPayload, 0);
  objc_storeStrong((id *)&self->_payloadString, 0);
}

@end
