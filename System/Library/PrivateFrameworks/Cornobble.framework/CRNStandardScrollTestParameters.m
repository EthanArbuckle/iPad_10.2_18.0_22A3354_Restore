@implementation CRNStandardScrollTestParameters

- (id)completionHandler
{
  return self->_completionHandler;
}

- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10 completionHandler:(id)a11
{
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  id v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  CRNOscillationScrollTestParameters *v27;
  CRNOscillationScrollTestParameters *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  unint64_t v34;
  id v35;
  int64_t v36;
  _BOOL8 v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  id v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  CRNStandardScrollTestParameters *v51;
  uint64_t v52;
  NSString *testName;
  uint64_t v54;
  id completionHandler;
  double v57;
  id v59;
  double v61;
  unint64_t v62;
  double v63;
  void *v64;
  objc_super v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[4];

  v12 = a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v68[2] = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v59 = a11;
  if (CRNAxisFromScrollDirection(a7) == 1)
    v22 = width;
  else
    v22 = height;
  v57 = a6;
  v23 = floor(a6 / v22);
  v24 = 0x24F13B000uLL;
  v25 = 2 * a4;
  v26 = a9 * 0.25;
  v27 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:]([CRNOscillationScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, 2 * a4, 0, v12, a7, 0, x, y, width, height);
  v68[0] = v27;
  v62 = a4;
  v61 = width;
  v63 = a9;
  v28 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:]([CRNOscillationScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, a4, 0, v12, a7, 1, x, y, width, height, v22, 0.0, a9);
  v68[1] = v28;
  v29 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 >= 1.0)
  {
    v32 = 1.0;
    do
    {
      v64 = (void *)objc_msgSend(objc_alloc(*(Class *)(v24 + 2016)), "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v25, 0, v12, a7, 0, x, y, width, height, v22 / 10.0, 15.0, v26);
      v67[0] = v64;
      v33 = (void *)objc_msgSend(objc_alloc(*(Class *)(v24 + 2016)), "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v62, 0, v12, a7, 1, x, y, width, height, v22, 0.0, v63);
      v67[1] = v33;
      objc_msgSend(*(id *)(v29 + 3632), "arrayWithObjects:count:", v67, 2);
      v34 = v29;
      v35 = v21;
      v36 = a7;
      v37 = v12;
      v38 = v25;
      v39 = v24;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v39;
      v25 = v38;
      v12 = v37;
      a7 = v36;
      v21 = v35;
      v29 = v34;

      v32 = v32 + 1.0;
      v30 = v31;
    }
    while (v32 <= v23);
  }
  else
  {
    v31 = v30;
  }
  if (a10)
  {
    v41 = objc_alloc(*(Class *)(v24 + 2016));
    v42 = v63;
    v43 = v29;
    v44 = v62;
    v46 = width;
    v45 = height;
    v47 = (void *)objc_msgSend(v41, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v62, 1, v12, CRNOppositeDirectionFrom(a7), 1, x, y, v61, height, v22, 0.0, v63 * 1.5);
    v66 = v47;
    objc_msgSend(*(id *)(v43 + 3632), "arrayWithObjects:count:", &v66, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v48);
    v49 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v49;
    v50 = v59;
  }
  else
  {
    v42 = v63;
    v50 = v59;
    v44 = v62;
    v46 = width;
    v45 = height;
  }
  v65.receiver = self;
  v65.super_class = (Class)CRNStandardScrollTestParameters;
  v51 = -[CRNGroupScrollTestParameters initWithTestName:withParameters:completionHandler:](&v65, sel_initWithTestName_withParameters_completionHandler_, v21, v31, 0);
  if (v51)
  {
    v52 = objc_msgSend(v21, "copy");
    testName = v51->_testName;
    v51->_testName = (NSString *)v52;

    v51->_scrollingBounds.origin.x = x;
    v51->_scrollingBounds.origin.y = y;
    v51->_scrollingBounds.size.width = v46;
    v51->_scrollingBounds.size.height = v45;
    v51->_iterations = v44;
    v51->_amplitude = v57;
    v51->_shouldFlick = a10;
    v51->_direction = a7;
    v51->_preventDismissalGestures = v12;
    v51->_iterationDuration = v42;
    v54 = MEMORY[0x22E2B5C74](v50);
    completionHandler = v51->_completionHandler;
    v51->_completionHandler = (id)v54;

  }
  return v51;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)testName
{
  return self->_testName;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8
{
  return (id)objc_msgSend(a1, "parametersForTestName:scrollView:iterations:direction:preventDismissalGestures:canUseFlicks:completionHandler:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 canUseFlicks:(BOOL)a9 completionHandler:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  CRNStandardScrollTestParameters *v43;

  v10 = a9;
  v11 = a8;
  v16 = a10;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v17, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v19, "convertRect:toView:", 0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(v17, "adjustedContentInset");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v36 = v23 + v29;
  v37 = v27 - (v29 + v33);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "userInterfaceIdiom");

  v40 = 25.0;
  if (v39 != 1)
    v40 = 5.0;
  v41 = v36 + v40;
  v42 = -70.0;
  if (v39 != 1)
    v42 = -10.0;
  v43 = -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:]([CRNStandardScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", v18, a5, a7, v11, v10, v16, v21 + v31 + 5.0, v41, v25 - (v31 + v35) + -10.0, v37 + v42, a6, 1.25);

  return v43;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  CRNStandardScrollTestParameters *v42;
  double v44;

  v9 = a8;
  v10 = a7;
  v15 = a9;
  v16 = a4;
  v17 = a3;
  v44 = CRNContentSizeInDirection(v16, a6);
  objc_msgSend(v16, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v18, "convertRect:toView:", 0);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v16, "adjustedContentInset");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v22 + v28;
  v36 = v26 - (v28 + v32);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "userInterfaceIdiom");

  v39 = 25.0;
  if (v38 != 1)
    v39 = 5.0;
  v40 = v35 + v39;
  v41 = -70.0;
  if (v38 != 1)
    v41 = -10.0;
  v42 = -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:]([CRNStandardScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", v17, a5, a6, v10, v9, v15, v20 + v30 + 5.0, v40, v24 - (v30 + v34) + -10.0, v36 + v41, v44, 1.25);

  return v42;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 preventDismissalGestures:(BOOL)a6 canUseFlicks:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;

  v8 = a7;
  v9 = a6;
  v13 = a8;
  v14 = a4;
  v15 = a3;
  v16 = CRNQuadrantOfContentOffsetFor(v14);
  +[CRNStandardScrollTestParameters parametersForTestName:scrollView:iterations:direction:preventDismissalGestures:canUseFlicks:completionHandler:](CRNStandardScrollTestParameters, "parametersForTestName:scrollView:iterations:direction:preventDismissalGestures:canUseFlicks:completionHandler:", v15, v14, a5, CRNOppositeDirectionFrom(v16), v9, v8, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10
{
  return -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", a3, a4, a7, a8, a10, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a9);
}

- (id)composerBlock
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  CRNOscillationScrollTestParameters *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL8 v19;
  int64_t v20;
  double v21;
  CRNOscillationScrollTestParameters *v22;
  CRNOscillationScrollTestParameters *v23;
  void *v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL8 v34;
  int64_t v35;
  double v36;
  CRNOscillationScrollTestParameters *v37;
  unint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  id v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _BOOL8 v53;
  int64_t v54;
  double v55;
  void *v56;
  id v57;
  void *v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _BOOL8 v68;
  unint64_t v69;
  unint64_t v70;
  int64_t v71;
  int64_t v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  unint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  _BOOL8 v88;
  uint64_t v89;
  double v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v96;
  objc_super v97;
  void *v98;
  _QWORD v99[2];
  _QWORD v100[3];

  v100[2] = *MEMORY[0x24BDAC8D0];
  v3 = CRNAxisFromScrollDirection(-[CRNStandardScrollTestParameters direction](self, "direction"));
  -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
  if (v3 == 1)
    v6 = v4;
  else
    v6 = v5;
  v7 = 0x24F13B000uLL;
  v8 = [CRNOscillationScrollTestParameters alloc];
  -[CRNStandardScrollTestParameters testName](self, "testName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 2 * -[CRNStandardScrollTestParameters iterations](self, "iterations");
  -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[CRNStandardScrollTestParameters preventDismissalGestures](self, "preventDismissalGestures");
  v20 = -[CRNStandardScrollTestParameters direction](self, "direction");
  -[CRNStandardScrollTestParameters iterationDuration](self, "iterationDuration");
  v22 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v8, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v9, v10, 0, v19, v20, 0, v12, v14, v16, v18, v6 / 10.0, 15.0, v21 * 0.25);
  v100[0] = v22;
  v23 = [CRNOscillationScrollTestParameters alloc];
  -[CRNStandardScrollTestParameters testName](self, "testName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CRNStandardScrollTestParameters iterations](self, "iterations");
  -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = -[CRNStandardScrollTestParameters preventDismissalGestures](self, "preventDismissalGestures");
  v35 = -[CRNStandardScrollTestParameters direction](self, "direction");
  -[CRNStandardScrollTestParameters iterationDuration](self, "iterationDuration");
  v37 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v23, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v24, v25, 0, v34, v35, 1, v27, v29, v31, v33, v6, 0.0, v36);
  v100[1] = v37;
  v38 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRNStandardScrollTestParameters amplitude](self, "amplitude");
  v41 = floor(v40 / v6);
  if (v41 <= 1.0)
  {
    v76 = v39;
  }
  else
  {
    v42 = 1.0;
    do
    {
      v43 = objc_alloc(*(Class *)(v7 + 2016));
      -[CRNStandardScrollTestParameters testName](self, "testName");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 2 * -[CRNStandardScrollTestParameters iterations](self, "iterations");
      -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v53 = -[CRNStandardScrollTestParameters preventDismissalGestures](self, "preventDismissalGestures");
      v54 = -[CRNStandardScrollTestParameters direction](self, "direction");
      -[CRNStandardScrollTestParameters iterationDuration](self, "iterationDuration");
      v56 = (void *)objc_msgSend(v43, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v96, v44, 0, v53, v54, 0, v46, v48, v50, v52, v6 / 10.0, 15.0, v55 * 0.25);
      v99[0] = v56;
      v57 = objc_alloc(*(Class *)(v7 + 2016));
      -[CRNStandardScrollTestParameters testName](self, "testName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[CRNStandardScrollTestParameters iterations](self, "iterations");
      -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v68 = -[CRNStandardScrollTestParameters preventDismissalGestures](self, "preventDismissalGestures");
      v69 = v7;
      v70 = v38;
      v71 = -[CRNStandardScrollTestParameters direction](self, "direction");
      -[CRNStandardScrollTestParameters iterationDuration](self, "iterationDuration");
      v72 = v71;
      v38 = v70;
      v7 = v69;
      v74 = (void *)objc_msgSend(v57, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v58, v59, 0, v68, v72, 1, v61, v63, v65, v67, v6, 0.0, v73);
      v99[1] = v74;
      objc_msgSend(*(id *)(v38 + 3632), "arrayWithObjects:count:", v99, 2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v42 + 1.0;
      v39 = v76;
    }
    while (v42 < v41);
  }
  if (-[CRNStandardScrollTestParameters shouldFlick](self, "shouldFlick"))
  {
    v77 = objc_alloc(*(Class *)(v7 + 2016));
    -[CRNStandardScrollTestParameters testName](self, "testName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[CRNStandardScrollTestParameters iterations](self, "iterations");
    -[CRNStandardScrollTestParameters scrollingBounds](self, "scrollingBounds");
    v81 = v80;
    v83 = v82;
    v85 = v84;
    v87 = v86;
    v88 = -[CRNStandardScrollTestParameters preventDismissalGestures](self, "preventDismissalGestures");
    v89 = CRNOppositeDirectionFrom(-[CRNStandardScrollTestParameters direction](self, "direction"));
    -[CRNStandardScrollTestParameters iterationDuration](self, "iterationDuration");
    v91 = (void *)objc_msgSend(v77, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v78, v79, 1, v88, v89, 1, v81, v83, v85, v87, v6, 0.0, v90 * 1.5);
    v98 = v91;
    objc_msgSend(*(id *)(v38 + 3632), "arrayWithObjects:count:", &v98, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "arrayByAddingObjectsFromArray:", v92);
    v93 = objc_claimAutoreleasedReturnValue();

    v76 = (void *)v93;
  }
  -[CRNGroupScrollTestParameters setParameters:](self, "setParameters:", v76);
  v97.receiver = self;
  v97.super_class = (Class)CRNStandardScrollTestParameters;
  -[CRNGroupScrollTestParameters composerBlock](&v97, sel_composerBlock);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  return v94;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGRect)scrollingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollingBounds.origin.x;
  y = self->_scrollingBounds.origin.y;
  width = self->_scrollingBounds.size.width;
  height = self->_scrollingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
