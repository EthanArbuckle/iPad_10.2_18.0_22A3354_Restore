@implementation AVInternetDateFormatter

- (AVInternetDateFormatter)init
{
  AVInternetDateFormatter *v2;
  NSISO8601DateFormatter *v3;
  NSISO8601DateFormatter *dateFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVInternetDateFormatter;
  v2 = -[AVInternetDateFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

  }
  return v2;
}

- (id)stringFromDate:(id)a3
{
  return -[NSISO8601DateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", a3);
}

- (id)dateFromString:(id)a3
{
  return -[NSISO8601DateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

+ (id)internetDateFormatter
{
  if (internetDateFormatter_onceToken != -1)
    dispatch_once(&internetDateFormatter_onceToken, &__block_literal_global_22737);
  return (id)internetDateFormatter__shared;
}

void __48__AVInternetDateFormatter_internetDateFormatter__block_invoke()
{
  AVInternetDateFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(AVInternetDateFormatter);
  v1 = (void *)internetDateFormatter__shared;
  internetDateFormatter__shared = (uint64_t)v0;

}

@end
