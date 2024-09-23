@implementation BCSDataDetectorsScannerResultData

- (BCSDataDetectorsScannerResultData)initWithScannerResult:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5
{
  id v9;
  id v10;
  BCSDataDetectorsScannerResultData *v11;
  BCSDataDetectorsScannerResultData *v12;
  uint64_t v13;
  NSString *extraPreviewText;
  BCSDataDetectorsScannerResultData *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BCSDataDetectorsScannerResultData;
  v11 = -[BCSDataDetectorsScannerResultData init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scannerResult, a3);
    v12->_type = a4;
    v13 = objc_msgSend(v10, "copy");
    extraPreviewText = v12->_extraPreviewText;
    v12->_extraPreviewText = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (BCSDataDetectorsScannerResultData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BCSDataDetectorsScannerResultData *v8;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getDDScannerResultClass(), CFSTR("scannerResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraPreviewText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BCSDataDetectorsScannerResultData initWithScannerResult:type:extraPreviewText:](self, "initWithScannerResult:type:extraPreviewText:", v5, objc_msgSend(v6, "integerValue"), v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  DDScannerResult *scannerResult;
  id v5;

  scannerResult = self->_scannerResult;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scannerResult, CFSTR("scannerResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extraPreviewText, CFSTR("extraPreviewText"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
}

@end
