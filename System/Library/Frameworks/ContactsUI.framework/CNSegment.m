@implementation CNSegment

- (CNSegment)initWithStart:(int64_t)a3 end:(int64_t)a4
{
  CNSegment *v6;
  uint64_t v7;
  NSNumber *start;
  uint64_t v9;
  NSNumber *end;
  CNSegment *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNSegment;
  v6 = -[CNSegment init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    start = v6->_start;
    v6->_start = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    end = v6->_end;
    v6->_end = (NSNumber *)v9;

    v11 = v6;
  }

  return v6;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNSegment start](self, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") < 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNSegment end](self, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue") >= 0;

  }
  return v5;
}

- (unint64_t)count
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CNSegment end](self, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  -[CNSegment start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "unsignedIntegerValue") + 1;

  return v6;
}

- (unint64_t)indexOffsetFrom:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[CNSegment start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue") + a3;

  -[CNSegment end](self, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 > objc_msgSend(v7, "unsignedIntegerValue"))
  {
    -[CNSegment end](self, "end");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v6;
}

- (NSNumber)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_storeStrong((id *)&self->_start, a3);
}

- (NSNumber)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
  objc_storeStrong((id *)&self->_end, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
