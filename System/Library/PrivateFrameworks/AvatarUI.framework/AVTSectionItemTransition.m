@implementation AVTSectionItemTransition

- (AVTSectionItemTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  _BOOL8 v10;
  id v13;
  AVTSectionItemTransition *v14;
  AVTSectionItemTransition *v15;
  objc_super v17;

  v10 = a4;
  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVTSectionItemTransition;
  v14 = -[AVTTransition initWithModel:animated:setupHandler:completionHandler:logger:](&v17, sel_initWithModel_animated_setupHandler_completionHandler_logger_, v13, v10, a5, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_sectionItemTransitionModel, a3);

  return v15;
}

- (void)performTransition
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void (**v9)(id, uint64_t);
  _QWORD v10[5];
  _QWORD v11[5];

  if (-[AVTTransition animated](self, "animated"))
  {
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__AVTSectionItemTransition_performTransition__block_invoke;
    v11[3] = &unk_1EA51D188;
    v11[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__AVTSectionItemTransition_performTransition__block_invoke_4;
    v10[3] = &unk_1EA51D250;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v11, v10, 0.5, 0.0);
  }
  else
  {
    -[AVTSectionItemTransition sectionItemTransitionModel](self, "sectionItemTransitionModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 1.0;
    objc_msgSend(v4, "setOpacity:", v5);

    -[AVTSectionItemTransition sectionItemTransitionModel](self, "sectionItemTransitionModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setOpacity:", v8);

    -[AVTTransition completionHandler](self, "completionHandler");
    v9 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 1);

  }
}

uint64_t __45__AVTSectionItemTransition_performTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVTSectionItemTransition_performTransition__block_invoke_2;
  v5[3] = &unk_1EA51D188;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __45__AVTSectionItemTransition_performTransition__block_invoke_3;
  v4[3] = &unk_1EA51D188;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);
}

void __45__AVTSectionItemTransition_performTransition__block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sectionItemTransitionModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setOpacity:", v2);

}

void __45__AVTSectionItemTransition_performTransition__block_invoke_3(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sectionItemTransitionModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fromLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 0;
  objc_msgSend(v1, "setOpacity:", v2);

}

void __45__AVTSectionItemTransition_performTransition__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void (**v5)(id, _QWORD);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, a2);

    }
  }
}

- (AVTSectionItemTransitionModel)sectionItemTransitionModel
{
  return self->_sectionItemTransitionModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionItemTransitionModel, 0);
}

@end
