@implementation CHPrefixQueryItem

- (void)dealloc
{
  CGPath *estimatedBaseline;
  objc_super v4;

  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline)
    CGPathRelease(estimatedBaseline);
  v4.receiver = self;
  v4.super_class = (Class)CHPrefixQueryItem;
  -[CHPrefixQueryItem dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqualToPrefixQueryItem:(id)a3
{
  CHPrefixQueryItem *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int isEqualToString;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const CGPath *v45;
  BOOL v46;
  int v48;
  CHPrefixQueryItem *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = (CHPrefixQueryItem *)a3;
  if (!v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v48 = 138412290;
      v49 = v4;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHPrefixQueryItem: %@", (uint8_t *)&v48, 0xCu);
    }

  }
  if (v4 == self)
  {
    v46 = 1;
    goto LABEL_14;
  }
  objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual)
    goto LABEL_12;
  objc_msgSend_queryResult(v4, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryResult(self, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v28, v35, (uint64_t)v34, v36, v37, v38);

  if (isEqualToString)
  {
    v45 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v40, v41, v42, v43, v44);
    v46 = CGPathEqualToPath(v45, self->_estimatedBaseline);
  }
  else
  {
LABEL_12:
    v46 = 0;
  }
LABEL_14:

  return v46;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSString)queryResult
{
  return self->_queryResult;
}

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
