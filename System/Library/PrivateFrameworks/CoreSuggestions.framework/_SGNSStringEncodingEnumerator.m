@implementation _SGNSStringEncodingEnumerator

- (_SGNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5
{
  id v9;
  _SGNSStringEncodingEnumerator *v10;
  _SGNSStringEncodingEnumerator *v11;
  uint64_t v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SGNSStringEncodingEnumerator;
  v10 = -[_SGNSStringEncodingEnumerator init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_encoding = a4;
    v12 = objc_msgSend(v9, "length");
    v11->_remaining.location = 0;
    v11->_remaining.length = v12;
    v11->_needsBOM = a4 == 10;
    v11->_needsNullTermination = a5;
  }

  return v11;
}

- (id)nullTerminationIfNeeded
{
  void *v2;

  if (self->_needsNullTermination)
  {
    self->_needsNullTermination = 0;
    nullByteData();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nextObject
{
  _NSRange *p_remaining;
  void *v4;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _NSRange v11;
  unint64_t v12;
  _BYTE v13[4096];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_remaining = &self->_remaining;
  if (!self->_remaining.length)
  {
    -[_SGNSStringEncodingEnumerator nullTerminationIfNeeded](self, "nullTerminationIfNeeded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (self->_needsBOM)
  {
    self->_needsBOM = 0;
    bomData();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v6 = (void *)MEMORY[0x1A8583A40]();
  bzero(v13, 0x1000uLL);
  v12 = 0;
  v11 = (_NSRange)0;
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self->_string, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 4096, &v12, self->_encoding, 0, p_remaining->location, p_remaining->length, &v11))
  {
    if (!v11.length)
    {
      v7 = v12;
      if (v12 <= 0xFFF && self->_needsNullTermination)
      {
        self->_needsNullTermination = 0;
        v12 = v7 + 1;
        v13[v7] = 0;
      }
    }
    *p_remaining = v11;
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v9 = objc_msgSend(v8, "initWithBytes:length:", v13, v12);
  }
  else
  {
    -[_SGNSStringEncodingEnumerator nullTerminationIfNeeded](self, "nullTerminationIfNeeded");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_autoreleasePoolPop(v6);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
