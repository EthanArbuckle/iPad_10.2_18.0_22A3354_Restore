@implementation MADServiceVideoTask

+ (id)taskForRequest:(id)a3
{
  return 0;
}

- (MADServiceVideoTask)initWithRequest:(id)a3
{

  return 0;
}

- (id)finalize
{
  return 0;
}

- (MADVideoRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
