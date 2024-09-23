@implementation AFUIUtilities

+ (void)animateUsingSpringWithStiffness:(double)a3 damping:(double)a4 animations:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;
  double v13;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BEBDB00];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__AFUIUtilities_animateUsingSpringWithStiffness_damping_animations___block_invoke;
  v10[3] = &unk_24D7A2F18;
  v12 = a3;
  v13 = a4;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "_performWithoutRetargetingAnimations:", v10);

}

uint64_t __68__AFUIUtilities_animateUsingSpringWithStiffness_damping_animations___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, *(_QWORD *)(a1 + 32), 0, DurationForMassStiffnessDamping(1.0, *(double *)(a1 + 40), *(double *)(a1 + 48)), 0.0, 1.0, *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);
}

+ (void)animateUsingSpringWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 animations:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;

  v11 = a6;
  v12 = a7;
  v13 = (void *)MEMORY[0x24BEBDB00];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__AFUIUtilities_animateUsingSpringWithMass_stiffness_damping_animations_completion___block_invoke;
  v16[3] = &unk_24D7A2F40;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v17 = v11;
  v18 = v12;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "_performWithoutRetargetingAnimations:", v16);

}

uint64_t __84__AFUIUtilities_animateUsingSpringWithMass_stiffness_damping_animations_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), DurationForMassStiffnessDamping(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)), 0.0, 1.0, *(double *)(a1 + 56), *(double *)(a1 + 64), 0.0);
}

+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BEA8690];
  v6 = (void *)MEMORY[0x24BEA8518];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsedUtteranceFromText:context:spekableObjectProviding:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)shouldShowSiriXIndicator
{
  int v2;
  void *v3;
  char v4;

  v2 = AFIsInternalInstall();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "siriXDebugStatusEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

@end
