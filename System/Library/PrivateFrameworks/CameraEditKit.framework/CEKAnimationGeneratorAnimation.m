@implementation CEKAnimationGeneratorAnimation

- (CEKAnimationGeneratorAnimation)initWithStartTime:(double)a3 duration:(double)a4 updateHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  CEKAnimationGeneratorAnimation *v12;
  CEKAnimationGeneratorAnimation *v13;
  uint64_t v14;
  id updateHandler;
  uint64_t v16;
  id completionHandler;
  CEKAnimationGeneratorAnimation *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CEKAnimationGeneratorAnimation;
  v12 = -[CEKAnimationGeneratorAnimation init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_startTime = a3;
    v12->_duration = a4;
    v14 = objc_msgSend(v10, "copy");
    updateHandler = v13->_updateHandler;
    v13->_updateHandler = (id)v14;

    v16 = objc_msgSend(v11, "copy");
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v16;

    v18 = v13;
  }

  return v13;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
