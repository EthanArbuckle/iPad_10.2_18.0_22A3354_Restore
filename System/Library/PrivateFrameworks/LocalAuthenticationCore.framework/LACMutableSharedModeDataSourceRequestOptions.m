@implementation LACMutableSharedModeDataSourceRequestOptions

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257088438))
  {
    v5 = v4;
    v6 = -[LACMutableSharedModeDataSourceRequestOptions isPreflight](self, "isPreflight");
    v7 = objc_msgSend(v5, "isPreflight");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v10 = CFSTR("isPreflight");
  v5 = -[LACMutableSharedModeDataSourceRequestOptions isPreflight](self, "isPreflight");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isPreflight
{
  return self->_isPreflight;
}

- (void)setIsPreflight:(BOOL)a3
{
  self->_isPreflight = a3;
}

@end
