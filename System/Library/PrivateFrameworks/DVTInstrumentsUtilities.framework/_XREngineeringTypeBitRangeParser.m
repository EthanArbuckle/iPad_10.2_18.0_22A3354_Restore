@implementation _XREngineeringTypeBitRangeParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C838 != -1)
    dispatch_once(&qword_25583C838, &unk_24EDC4250);
  return (id)qword_25583C830;
}

- (void)_handleCompletion
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v32 = (id)objc_opt_new();
  objc_msgSend_type(self, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v32, v8, (uint64_t)v7, v9, v10);

  v15 = objc_msgSend_start(self, v11, v12, v13, v14);
  v20 = objc_msgSend_end(self, v16, v17, v18, v19);
  if (v15 <= v20)
    v23 = v20;
  else
    v23 = v15;
  if (v15 >= v20)
    objc_msgSend_setBitRange_(v32, v21, v20, v23 - v20 + 1, v22);
  else
    objc_msgSend_setBitRange_(v32, v21, v15, v23 - v15 + 1, v22);
  objc_msgSend_convention(self->super.parent, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntry_(v28, v29, (uint64_t)v32, v30, v31);

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)start
{
  return self->_start;
}

- (void)setStart:(int64_t)a3
{
  self->_start = a3;
}

- (int64_t)end
{
  return self->_end;
}

- (void)setEnd:(int64_t)a3
{
  self->_end = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
