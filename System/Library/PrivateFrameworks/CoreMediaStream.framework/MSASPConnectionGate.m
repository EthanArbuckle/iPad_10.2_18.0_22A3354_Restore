@implementation MSASPConnectionGate

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)gate
{
  return objc_alloc_init(MSASPConnectionGate);
}

@end
