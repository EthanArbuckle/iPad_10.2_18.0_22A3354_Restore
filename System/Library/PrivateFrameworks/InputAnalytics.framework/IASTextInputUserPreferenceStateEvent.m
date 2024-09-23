@implementation IASTextInputUserPreferenceStateEvent

- (void)dispatchEvent:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isDispatchable;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t preferenceValue;
  NSString *preferenceName;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  isDispatchable = objc_msgSend_isDispatchable(self, v5, v6, v7, v8);
  if (v4 && isDispatchable)
  {
    preferenceName = self->_preferenceName;
    preferenceValue = self->_preferenceValue;
    v18[0] = CFSTR("preferenceName");
    v18[1] = CFSTR("currentValue");
    v19[0] = preferenceName;
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, preferenceValue, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v19, (uint64_t)v18, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v17);
  }

}

- (BOOL)isDispatchable
{
  return self->_preferenceName != 0;
}

- (NSString)preferenceName
{
  return self->_preferenceName;
}

- (void)setPreferenceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)preferenceValue
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(int64_t)a3
{
  self->_preferenceValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceName, 0);
}

@end
