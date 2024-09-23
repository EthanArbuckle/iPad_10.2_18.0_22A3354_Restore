@implementation MRMediaSuggestionController

- (MRMediaSuggestionController)initWithRequest:(id)a3
{

  return 0;
}

- (MRMediaSuggestionControllerDelegate)delegate
{
  return (MRMediaSuggestionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRMediaSuggestionRequest)request
{
  return self->_request;
}

- (NSDictionary)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
