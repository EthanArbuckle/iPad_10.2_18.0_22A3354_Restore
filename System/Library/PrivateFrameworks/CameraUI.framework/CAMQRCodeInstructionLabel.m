@implementation CAMQRCodeInstructionLabel

+ (BOOL)shouldDisplayInstructionForMRCResults:(id)a3 devicePosition:(int64_t)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "_textForMRCResults:devicePosition:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

+ (id)_textForMRCResults:(id)a3 devicePosition:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
LABEL_13:
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(v5, "count");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "isOfSignificantSize", (_QWORD)v14))
          {

            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }

    if (v7)
    {
      CAMLocalizedFrameworkString(CFSTR("QR_CODE_MOVE_CLOSER"), &stru_1EA3325A0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (void)setDevicePosition:(int64_t)a3
{
  if (self->_devicePosition != a3)
  {
    self->_devicePosition = a3;
    -[CAMQRCodeInstructionLabel _updateTextWithPriorMRCResults:](self, "_updateTextWithPriorMRCResults:", self->_mrcResults);
  }
}

- (void)setMRCResults:(id)a3
{
  NSArray *v4;
  NSArray *mrcResults;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  mrcResults = self->_mrcResults;
  if (mrcResults != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_mrcResults;
    self->_mrcResults = v6;
    v8 = mrcResults;

    -[CAMQRCodeInstructionLabel _updateTextWithPriorMRCResults:](self, "_updateTextWithPriorMRCResults:", v8);
    v4 = v9;
  }

}

- (void)_updateTextWithPriorMRCResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CAMQRCodeInstructionLabel mrcResults](self, "mrcResults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_textForMRCResults:devicePosition:", v8, -[CAMQRCodeInstructionLabel devicePosition](self, "devicePosition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_textForMRCResults:devicePosition:", v4, -[CAMQRCodeInstructionLabel devicePosition](self, "devicePosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[CAMInstructionLabel setText:](self, "setText:", v5);
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMInstructionLabel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (NSArray)mrcResults
{
  return self->_mrcResults;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CAMQRCodeInstructionLabel;
  -[CAMInstructionLabel sizeThatFits:](&v9, sel_sizeThatFits_);
  if (v5 < 108.0 && height == 0.0 && width == 0.0)
    v5 = 108.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mrcResults, 0);
}

@end
