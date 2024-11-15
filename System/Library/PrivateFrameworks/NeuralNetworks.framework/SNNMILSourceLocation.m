@implementation SNNMILSourceLocation

- (SNNMILSourceLocation)init
{
  SNNMILSourceLocation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SNNMILSourceLocation;
  result = -[SNNMILSourceLocation init](&v3, sel_init);
  result->_isLocationKnown = 0;
  return result;
}

- (SNNMILSourceLocation)initWithFilename:(id)a3 line:(unint64_t)a4 column:(unint64_t)a5
{
  NSString *v8;
  SNNMILSourceLocation *v9;
  NSString *filename;
  objc_super v12;

  v8 = (NSString *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SNNMILSourceLocation;
  v9 = -[SNNMILSourceLocation init](&v12, sel_init);
  v9->_isLocationKnown = 1;
  filename = v9->_filename;
  v9->_filename = v8;

  v9->_line = a4;
  v9->_column = a5;
  return v9;
}

+ (id)locationOrEmpty:(id)a3
{
  id v3;
  void *v4;
  SNNMILSourceLocation *v5;
  SNNMILSourceLocation *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (SNNMILSourceLocation *)v3;
  else
    v5 = objc_alloc_init(SNNMILSourceLocation);
  v6 = v5;

  return v6;
}

- (unique_ptr<MIL::Location,)milLocation
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *__p;
  char v6;
  uint64_t v7;

  v3 = v2;
  if (self->_isLocationKnown)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_filename, "UTF8String"));
    v4 = MIL::TextFileLocation::Make();
    *v3 = v7;
    v7 = 0;
    if (v6 < 0)
      operator delete(__p);
  }
  else
  {
    v4 = MIL::UnknownLocation::Make((MIL::UnknownLocation *)self);
    *v3 = v7;
  }
  return (unique_ptr<MIL::Location, std::default_delete<MIL::Location>>)v4;
}

- (BOOL)isLocationKnown
{
  return self->_isLocationKnown;
}

- (NSString)filename
{
  return self->_filename;
}

- (unint64_t)line
{
  return self->_line;
}

- (unint64_t)column
{
  return self->_column;
}

- (void).cxx_destruct
{
  Location *value;

  objc_storeStrong((id *)&self->_filename, 0);
  value = self->_milLocation.__ptr_.__value_;
  self->_milLocation.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Location *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
