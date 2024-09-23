@implementation _CSVisualizerTableFunctions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = MEMORY[0x1A85AA61C](self->_getSummary);
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = MEMORY[0x1A85AA61C](self->_getDescription);
    v8 = (void *)v4[2];
    v4[2] = v7;

  }
  return v4;
}

- (id)getSummary
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setGetSummary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)getDescription
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setGetDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getDescription, 0);
  objc_storeStrong(&self->_getSummary, 0);
}

@end
