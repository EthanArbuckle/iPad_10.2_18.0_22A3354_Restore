@implementation BPSScreenStringObj

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size496h, 0);
  objc_storeStrong((id *)&self->_size446h, 0);
  objc_storeStrong((id *)&self->_size502h, 0);
  objc_storeStrong((id *)&self->_size484h, 0);
  objc_storeStrong((id *)&self->_size430h, 0);
  objc_storeStrong((id *)&self->_size448h, 0);
  objc_storeStrong((id *)&self->_size394h, 0);
  objc_storeStrong((id *)&self->_regular, 0);
  objc_storeStrong((id *)&self->_compact, 0);
}

- (NSString)regular
{
  return self->_regular;
}

- (NSString)compact
{
  return self->_compact;
}

+ (id)screenStringsWithArray:(id)a3
{
  id v3;
  BPSScreenStringObj *v4;

  v3 = a3;
  v4 = -[BPSScreenStringObj initWithArray:]([BPSScreenStringObj alloc], "initWithArray:", v3);

  return v4;
}

- (BPSScreenStringObj)initWithArray:(id)a3
{
  id v4;
  BPSScreenStringObj *v5;
  uint64_t v6;
  NSString *compact;
  uint64_t v8;
  NSString *regular;
  uint64_t v10;
  NSString *size394h;
  uint64_t v12;
  NSString *size448h;
  uint64_t v14;
  NSString *size430h;
  uint64_t v16;
  NSString *size484h;
  uint64_t v18;
  NSString *size502h;
  uint64_t v20;
  NSString *size446h;
  uint64_t v22;
  NSString *size496h;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BPSScreenStringObj;
  v5 = -[BPSScreenStringObj init](&v25, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      compact = v5->_compact;
      v5->_compact = (NSString *)v6;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v8 = objc_claimAutoreleasedReturnValue();
      regular = v5->_regular;
      v5->_regular = (NSString *)v8;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 3)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
      size394h = v5->_size394h;
      v5->_size394h = (NSString *)v10;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
      v12 = objc_claimAutoreleasedReturnValue();
      size448h = v5->_size448h;
      v5->_size448h = (NSString *)v12;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 5)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
      v14 = objc_claimAutoreleasedReturnValue();
      size430h = v5->_size430h;
      v5->_size430h = (NSString *)v14;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 6)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
      v16 = objc_claimAutoreleasedReturnValue();
      size484h = v5->_size484h;
      v5->_size484h = (NSString *)v16;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 7)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 6);
      v18 = objc_claimAutoreleasedReturnValue();
      size502h = v5->_size502h;
      v5->_size502h = (NSString *)v18;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 8)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 7);
      v20 = objc_claimAutoreleasedReturnValue();
      size446h = v5->_size446h;
      v5->_size446h = (NSString *)v20;

    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 9)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 8);
      v22 = objc_claimAutoreleasedReturnValue();
      size496h = v5->_size496h;
      v5->_size496h = (NSString *)v22;

    }
  }

  return v5;
}

- (void)setCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRegular:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)size394h
{
  return self->_size394h;
}

- (void)setSize394h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)size448h
{
  return self->_size448h;
}

- (void)setSize448h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)size430h
{
  return self->_size430h;
}

- (void)setSize430h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)size484h
{
  return self->_size484h;
}

- (void)setSize484h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)size502h
{
  return self->_size502h;
}

- (void)setSize502h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)size446h
{
  return self->_size446h;
}

- (void)setSize446h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)size496h
{
  return self->_size496h;
}

- (void)setSize496h:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
