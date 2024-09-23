@implementation DDMLResult

- (DDMLResult)initWithText:(id)a3 resultRange:(_NSRange)a4 confidence:(double)a5 resultType:(int)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  DDMLResult *v12;
  DDMLResult *v13;
  uint64_t v14;
  NSString *matchedString;
  objc_super v17;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DDMLResult;
  v12 = -[DDMLResult init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_classification = a6;
    v12->_range.location = location;
    v12->_range.length = length;
    v12->_confidence = a5;
    objc_msgSend(v11, "substringWithRange:", location, length);
    v14 = objc_claimAutoreleasedReturnValue();
    matchedString = v13->_matchedString;
    v13->_matchedString = (NSString *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[DDMLResult range](self, "range");
  -[DDMLResult range](self, "range");
  v6 = v5;
  v7 = -[DDMLResult classification](self, "classification");
  if (v7 > 0xA)
    v8 = 0;
  else
    v8 = off_1E3C94E70[v7];
  -[DDMLResult matchedString](self, "matchedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<DDMLResult:%p (%ld, %ld) %@ \"%@\">"), self, v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "range");
    v7 = v6;
    -[DDMLResult range](self, "range");
    if (v7 != v8)
      goto LABEL_8;
    v9 = objc_msgSend(v5, "range");
    if (v9 != -[DDMLResult range](self, "range"))
      goto LABEL_8;
    objc_msgSend(v5, "matchedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDMLResult matchedString](self, "matchedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_8;
    v13 = objc_msgSend(v5, "classification");
    if (v13 == -[DDMLResult classification](self, "classification"))
    {
      objc_msgSend(v5, "confidence");
      v15 = v14;
      -[DDMLResult confidence](self, "confidence");
      v17 = v15 == v16;
    }
    else
    {
LABEL_8:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (__DDResult)ddResultFromQuery:(__DDScanQuery *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __DDQueryFragment *var1;
  int64_t var3;
  unint64_t OffsetOfAbsolutePosition;
  unint64_t v11;
  __DDResult *v12;
  __DDResult *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  __DDQueryFragment *v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __DDResult *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  __DDResult *v29;

  if (-[DDMLResult classification](self, "classification"))
  {
    if (-[DDMLResult classification](self, "classification") == 1)
    {
      v5 = -[DDMLResult range](self, "range");
      v7 = v6;
      var1 = a3->var1;
      var3 = a3->var3;
      OffsetOfAbsolutePosition = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)var1, var3, v5);
      v11 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)var1, var3, v5 + v7);
      v12 = (__DDResult *)DDResultCreate(CFSTR("Location"), OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000, v11 & 0xFFFFFFFFFFFF0000);
      if (v12)
      {
        v13 = v12;
        -[DDMLResult matchedString](self, "matchedString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        DDResultSetMatchedString((uint64_t)v13, v14);

        goto LABEL_8;
      }
    }
  }
  else
  {
    v15 = -[DDMLResult range](self, "range");
    v17 = v16;
    v18 = a3->var1;
    v19 = a3->var3;
    v20 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)v18, v19, v15);
    v21 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)v18, v19, v15 + v17);
    v22 = v20 & 0xFFFFFFFFFFFF0000;
    v23 = v21 & 0xFFFFFFFFFFFF0000;
    v24 = (__DDResult *)DDResultCreate(CFSTR("FullAddress"), v22, v21 & 0xFFFFFFFFFFFF0000);
    if (v24)
    {
      v13 = v24;
      -[DDMLResult matchedString](self, "matchedString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      DDResultSetMatchedString((uint64_t)v13, v25);

      v13->var2.var0 = v15;
      v13->var2.var1 = v17;
      v26 = DDResultCreate(CFSTR("Street"), v22, v23);
      if (!v26)
      {
        v29 = 0;
        goto LABEL_11;
      }
      v27 = v26;
      -[DDMLResult matchedString](self, "matchedString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      DDResultSetMatchedString((uint64_t)v27, v28);

      DDResultAddSubresult((uint64_t)v13, v27);
      CFRelease(v27);
LABEL_8:
      v29 = v13;
LABEL_11:
      CFAutorelease(v13);
      return v29;
    }
  }
  return 0;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)matchedString
{
  return self->_matchedString;
}

- (void)setMatchedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)classification
{
  return self->_classification;
}

- (void)setClassification:(int)a3
{
  self->_classification = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedString, 0);
}

+ (BOOL)shouldKeepResultOfType:(id)a3
{
  return objc_msgSend(a3, "hasSuffix:", CFSTR("MLCandidate")) ^ 1;
}

@end
