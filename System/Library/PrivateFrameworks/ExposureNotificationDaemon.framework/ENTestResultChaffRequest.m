@implementation ENTestResultChaffRequest

- (id)additionalRequestHeaders
{
  const __CFString *chaffValue;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_chaffValue)
    chaffValue = (const __CFString *)self->_chaffValue;
  else
    chaffValue = CFSTR("extra");
  v4 = CFSTR("X-Chaff");
  v5[0] = chaffValue;
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)chaffValue
{
  return self->_chaffValue;
}

- (void)setChaffValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chaffValue, 0);
}

@end
