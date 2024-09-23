@implementation CAMCaptureCoordinationInfo

- (CAMCaptureCoordinationInfo)initWithIdentifier:(id)a3 allExpectedResultSpecifiers:(id)a4 resultSpecifiers:(unint64_t)a5
{
  id v8;
  id v9;
  CAMCaptureCoordinationInfo *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSSet *allExpectedResultSpecifiers;
  CAMCaptureCoordinationInfo *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CAMCaptureCoordinationInfo;
  v10 = -[CAMCaptureCoordinationInfo init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    allExpectedResultSpecifiers = v10->_allExpectedResultSpecifiers;
    v10->_allExpectedResultSpecifiers = (NSSet *)v13;

    v10->_resultSpecifiers = a5;
    v15 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CAMCaptureCoordinationInfo;
  -[CAMCaptureCoordinationInfo description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers");
  v6 = v5;
  if ((v5 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = &stru_1EA3325A0;
  if ((v5 & 1) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("HDR"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v8;
  }
LABEL_6:
  if (!-[__CFString length](v7, "length"))
  {

    v7 = CFSTR("None");
  }
  -[CAMCaptureCoordinationInfo allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke;
  v14[3] = &unk_1EA329B78;
  v14[4] = &v15;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ (of %@)"), v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isHDR
{
  return -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers") & 1;
}

- (BOOL)isFiltered
{
  return (-[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers") >> 1) & 1;
}

- (BOOL)isUnfilteredImageForFilteredPair
{
  void *v3;
  unint64_t v4;
  char v5;
  void *v6;

  -[CAMCaptureCoordinationInfo allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers");
  if (v4 == (v4 | 2))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v6);

  }
  return v5;
}

- (BOOL)isFilteredImageForFilteredPair
{
  void *v3;
  unint64_t v4;
  char v5;
  void *v6;

  -[CAMCaptureCoordinationInfo allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers");
  if (v4 == (v4 & 0xFFFFFFFFFFFFFFFDLL))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v6);

  }
  return v5;
}

- (BOOL)isEV0ForHDREV0Pair
{
  void *v3;
  unint64_t v4;
  char v5;
  void *v6;

  -[CAMCaptureCoordinationInfo allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers");
  if (v4 == (v4 | 1))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v6);

  }
  return v5;
}

- (BOOL)isHDRForHDREV0Pair
{
  void *v3;
  unint64_t v4;
  char v5;
  void *v6;

  -[CAMCaptureCoordinationInfo allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCaptureCoordinationInfo resultSpecifiers](self, "resultSpecifiers");
  if (v4 == (v4 & 0xFFFFFFFFFFFFFFFELL))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v6);

  }
  return v5;
}

- (BOOL)isFinalExpectedStillImageResult
{
  if (-[CAMCaptureCoordinationInfo isEV0ForHDREV0Pair](self, "isEV0ForHDREV0Pair"))
    return 0;
  else
    return !-[CAMCaptureCoordinationInfo isUnfilteredImageForFilteredPair](self, "isUnfilteredImageForFilteredPair");
}

- (BOOL)isFinalExpectedVideoResult
{
  return !-[CAMCaptureCoordinationInfo isEV0ForHDREV0Pair](self, "isEV0ForHDREV0Pair");
}

- (BOOL)representsFinalProcessedStillImage
{
  if (-[CAMCaptureCoordinationInfo isEV0ForHDREV0Pair](self, "isEV0ForHDREV0Pair"))
    return 0;
  else
    return !-[CAMCaptureCoordinationInfo isUnfilteredImageForFilteredPair](self, "isUnfilteredImageForFilteredPair");
}

- (BOOL)representsFinalProcessedVideo
{
  return !-[CAMCaptureCoordinationInfo isEV0ForHDREV0Pair](self, "isEV0ForHDREV0Pair");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allExpectedResultSpecifiers
{
  return self->_allExpectedResultSpecifiers;
}

- (unint64_t)resultSpecifiers
{
  return self->_resultSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExpectedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
