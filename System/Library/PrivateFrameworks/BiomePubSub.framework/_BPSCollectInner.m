@implementation _BPSCollectInner

- (id)receiveNewValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BPSReduceProducer result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return +[BPSPartialCompletion withState:](BPSPartialCompletion, "withState:", 1);
}

@end
