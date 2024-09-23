@implementation WFBlockRecoveryAttempter

- (WFBlockRecoveryAttempter)initWithHandlerBlock:(id)a3
{
  id v4;
  WFBlockRecoveryAttempter *v5;
  uint64_t v6;
  id handlerBlock;
  WFBlockRecoveryAttempter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFBlockRecoveryAttempter;
  v5 = -[WFBlockRecoveryAttempter init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handlerBlock = v5->_handlerBlock;
    v5->_handlerBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, unint64_t, id, id);

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[WFBlockRecoveryAttempter handlerBlock](self, "handlerBlock");
  v13 = (void (**)(id, id, unint64_t, id, id))objc_claimAutoreleasedReturnValue();
  v13[2](v13, v12, a4, v11, v10);

}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  -[WFBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:userInterface:completionHandler:](self, "attemptRecoveryFromError:optionIndex:userInterface:completionHandler:", a3, a4, 0, 0);
  return 1;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
}

@end
