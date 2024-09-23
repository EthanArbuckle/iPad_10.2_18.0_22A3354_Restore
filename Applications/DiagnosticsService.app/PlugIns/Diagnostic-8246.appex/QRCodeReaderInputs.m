@implementation QRCodeReaderInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v13;
  _QWORD v14[13];

  v13 = 0;
  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("viewfinderInstruction"), 1000, &v13));
  -[QRCodeReaderInputs setViewfinderInstruction:](self, "setViewfinderInstruction:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeout"), &off_10000C5E8, &off_10000C600, &off_10000C5E8, &v13));
  -[QRCodeReaderInputs setTimeout:](self, "setTimeout:", v6);

  v14[0] = AVMetadataObjectTypeUPCECode;
  v14[1] = AVMetadataObjectTypeCode39Code;
  v14[2] = AVMetadataObjectTypeCode39Mod43Code;
  v14[3] = AVMetadataObjectTypeEAN13Code;
  v14[4] = AVMetadataObjectTypeEAN8Code;
  v14[5] = AVMetadataObjectTypeCode93Code;
  v14[6] = AVMetadataObjectTypeCode128Code;
  v14[7] = AVMetadataObjectTypePDF417Code;
  v14[8] = AVMetadataObjectTypeQRCode;
  v14[9] = AVMetadataObjectTypeAztecCode;
  v14[10] = AVMetadataObjectTypeInterleaved2of5Code;
  v14[11] = AVMetadataObjectTypeITF14Code;
  v14[12] = AVMetadataObjectTypeDataMatrixCode;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 13));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:inSet:maxLength:failed:", CFSTR("codeTypes"), v8, 13, &v13));

  -[QRCodeReaderInputs setCodeTypes:](self, "setCodeTypes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderInputs codeTypes](self, "codeTypes"));
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    v13 = 1;

  return v13 == 0;
}

- (NSString)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderInstruction, a3);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (NSArray)codeTypes
{
  return self->_codeTypes;
}

- (void)setCodeTypes:(id)a3
{
  objc_storeStrong((id *)&self->_codeTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeTypes, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);
}

@end
