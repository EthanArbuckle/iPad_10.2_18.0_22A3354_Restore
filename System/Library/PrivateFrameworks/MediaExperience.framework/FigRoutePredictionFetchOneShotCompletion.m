@implementation FigRoutePredictionFetchOneShotCompletion

- (FigRoutePredictionFetchOneShotCompletion)init
{
  return -[FigRoutePredictionFetchOneShotCompletion initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (FigRoutePredictionFetchOneShotCompletion)initWithCompletionHandler:(id)a3
{
  FigRoutePredictionFetchOneShotCompletion *v4;
  uint64_t v5;
  FigRoutePredictionFetchOneShotCompletion *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigRoutePredictionFetchOneShotCompletion;
  v4 = -[FigRoutePredictionFetchOneShotCompletion init](&v8, sel_init);
  if (v4 && (v5 = objc_msgSend(a3, "copy"), (v4->_completionHandler = (id)v5) != 0))
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigRoutePredictionFetchOneShotCompletion;
  -[FigRoutePredictionFetchOneShotCompletion dealloc](&v3, sel_dealloc);
}

- (void)invokeWithRoutePredictions:(id)a3 predictionContext:(id)a4
{
  void (**completionHandler)(id, id, id);

  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);

    self->_completionHandler = 0;
  }
}

@end
