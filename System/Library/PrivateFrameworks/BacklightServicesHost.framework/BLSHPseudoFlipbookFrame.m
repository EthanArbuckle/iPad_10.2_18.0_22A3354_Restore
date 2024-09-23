@implementation BLSHPseudoFlipbookFrame

- (BLSHPseudoFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 specifier:(id)a5 memoryUsage:(unint64_t)a6
{
  id v10;
  BLSHPseudoFlipbookFrame *v11;
  BLSHPseudoFlipbookFrame *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHPseudoFlipbookFrame;
  v11 = -[BLSHPseudoFlipbookFrame init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_presentationTime = a3;
    v11->_frameId = a4;
    objc_storeStrong((id *)&v11->_bls_specifier, a5);
  }

  return v12;
}

- (float)apl
{
  return NAN;
}

- (float)aplDimming
{
  return NAN;
}

- (__IOSurface)surface
{
  return 0;
}

- (__IOSurface)rawSurface
{
  return 0;
}

- (CGRect)rawSurfaceFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isInverted
{
  return 0;
}

- (NSUUID)bls_uuid
{
  return 0;
}

- (id)bls_loggingString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHPseudoFlipbookFrame presentationTime](self, "presentationTime");
  BLSLoggingStringForMachTime();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("presentationTime"));

  v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSHPseudoFlipbookFrame frameId](self, "frameId"), CFSTR("frameId"));
  -[BLSHPseudoFlipbookFrame bls_specifier](self, "bls_specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("specifier"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSHPseudoFlipbookFrame frameId](self, "frameId"), CFSTR("frameId"));
  -[BLSHPseudoFlipbookFrame bls_specifier](self, "bls_specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BLSHPseudoFlipbookFrame bls_specifier](self, "bls_specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bls_shortLoggingString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v7, &stru_24D1BE888);

  }
  else
  {
    -[BLSHPseudoFlipbookFrame presentationTime](self, "presentationTime");
    BLSShortLoggingStringForMachTime();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, &stru_24D1BE888);
  }

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (BLSHPresentationDateSpecifier)bls_specifier
{
  return self->_bls_specifier;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bls_specifier, 0);
}

@end
