@implementation DERewindableReader

- (DERewindableReader)initWithReader:(id)a3
{
  id v5;
  DERewindableReader *v6;
  DERewindableReader *v7;
  uint64_t v8;
  NSMutableData *rewindData;
  DERewindableReader *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DERewindableReader;
  v6 = -[DERewindableReader init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reader, a3);
    v7->_rewound = 0;
    v8 = objc_opt_new();
    rewindData = v7->_rewindData;
    v7->_rewindData = (NSMutableData *)v8;

    v7->_rewindOffset = 0;
    v10 = v7;
  }

  return v7;
}

- (DERewindableReader)init
{
  return -[DERewindableReader initWithReader:](self, "initWithReader:", 0);
}

- (void)dealloc
{
  DEReader *reader;
  DEReader *v4;
  objc_super v5;

  reader = self->_reader;
  if (reader)
  {
    -[DEReader close](reader, "close");
    v4 = self->_reader;
    self->_reader = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DERewindableReader;
  -[DERewindableReader dealloc](&v5, sel_dealloc);
}

- (void)disableRewind
{
  NSMutableData *rewindData;

  rewindData = self->_rewindData;
  self->_rewindData = 0;

}

- (BOOL)isRewindable
{
  return self->_rewindData && !self->_rewound;
}

- (BOOL)rewind
{
  _BOOL4 v3;

  v3 = -[DERewindableReader isRewindable](self, "isRewindable");
  if (v3)
    self->_rewound = 1;
  return v3;
}

- (void)close
{
  DEReader *reader;
  DEReader *v4;

  reader = self->_reader;
  if (reader)
  {
    -[DEReader close](reader, "close");
    v4 = self->_reader;
    self->_reader = 0;

  }
}

- (id)readDataOfLength:(unint64_t)a3
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  NSMutableData *rewindData;
  NSMutableData *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  if (self->_rewound && self->_rewindData)
  {
    +[DEIO readDataOfLength:offset:from:](DEIO, "readDataOfLength:offset:from:", a3, self->_rewindOffset);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    rewindData = self->_rewindData;
    self->_rewindOffset += v6;
    if (-[NSMutableData length](rewindData, "length") == self->_rewindOffset)
    {
      v8 = self->_rewindData;
      self->_rewindData = 0;

    }
    v3 -= objc_msgSend(v5, "length");
    if (!v3)
    {
      v5 = v5;
      v9 = v5;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
  }
  -[DEReader readDataOfLength:](self->_reader, "readDataOfLength:", v3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v5 && v10)
  {
    v9 = (id)objc_opt_new();
    objc_msgSend(v9, "appendData:", v5);
    objc_msgSend(v9, "appendData:", v11);
  }
  else
  {
    if (-[DERewindableReader isRewindable](self, "isRewindable"))
      -[NSMutableData appendData:](self->_rewindData, "appendData:", v11);
    v9 = v11;
  }

LABEL_15:
  return v9;
}

- (id)readData
{
  void *v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t rewindOffset;
  id v7;
  void *v8;

  -[DEReader readData](self->_reader, "readData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_rewound && (v4 = self->_rewindOffset, v4 < -[NSMutableData length](self->_rewindData, "length")))
  {
    v5 = -[NSMutableData length](self->_rewindData, "length");
    rewindOffset = self->_rewindOffset;
    v7 = (id)objc_opt_new();
    -[DERewindableReader readDataOfLength:](self, "readDataOfLength:", v5 - rewindOffset);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v8);

    objc_msgSend(v7, "appendData:", v3);
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (DEReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (BOOL)rewound
{
  return self->_rewound;
}

- (void)setRewound:(BOOL)a3
{
  self->_rewound = a3;
}

- (NSMutableData)rewindData
{
  return self->_rewindData;
}

- (void)setRewindData:(id)a3
{
  objc_storeStrong((id *)&self->_rewindData, a3);
}

- (unint64_t)rewindOffset
{
  return self->_rewindOffset;
}

- (void)setRewindOffset:(unint64_t)a3
{
  self->_rewindOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewindData, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
