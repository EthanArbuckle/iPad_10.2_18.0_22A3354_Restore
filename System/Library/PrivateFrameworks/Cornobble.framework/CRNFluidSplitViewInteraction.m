@implementation CRNFluidSplitViewInteraction

+ (id)newWithSplitViewController:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;
  v6 = v3;

  objc_msgSend(v6, "viewControllerForColumn:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  objc_msgSend(v6, "viewControllerForColumn:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (id)composerBlock
{
  void *v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double MidpointAlongSide;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[8];

  -[UIViewController view](self->_supplementalController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CRNViewFrameInWindow(v3);
  MidpointAlongSide = CRNCGRectGetMidpointAlongSide(1, v4, v5, v6, v7);
  v10 = v9;

  -[UIViewController view](self->_supplementalController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CRNViewFrameInWindow(v11);
  v16 = CRNCGRectGetMidpointAlongSide(3, v12, v13, v14, v15);
  v18 = v17;

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __45__CRNFluidSplitViewInteraction_composerBlock__block_invoke;
  v20[3] = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
  *(double *)&v20[4] = MidpointAlongSide;
  v20[5] = v10;
  *(double *)&v20[6] = v16;
  v20[7] = v18;
  return (id)MEMORY[0x22E2B5C74](v20);
}

void __45__CRNFluidSplitViewInteraction_composerBlock__block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "touchDown:", v3, v4);
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 1.0);
  objc_msgSend(v5, "advanceTime:", 0.2);
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 1.0);
  objc_msgSend(v5, "advanceTime:", 0.2);
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 0.6);
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 0.6);
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 0.3);
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 0.3);
  objc_msgSend(v5, "liftUp:", a1[4], a1[5]);
  objc_msgSend(v5, "advanceTime:", 0.5);
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.6);
  objc_msgSend(v5, "advanceTime:", 2.0);
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[6], a1[7], a1[4], a1[5], 0.6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryController, 0);
  objc_storeStrong((id *)&self->_supplementalController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end
