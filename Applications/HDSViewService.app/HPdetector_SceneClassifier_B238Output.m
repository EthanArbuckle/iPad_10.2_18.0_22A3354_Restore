@implementation HPdetector_SceneClassifier_B238Output

- (HPdetector_SceneClassifier_B238Output)initWithHomePodDetected:(id)a3
{
  id v5;
  HPdetector_SceneClassifier_B238Output *v6;
  HPdetector_SceneClassifier_B238Output *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPdetector_SceneClassifier_B238Output;
  v6 = -[HPdetector_SceneClassifier_B238Output init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_HomePodDetected, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000C7190);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HomePodDetected")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HPdetector_SceneClassifier_B238Output HomePodDetected](self, "HomePodDetected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)HomePodDetected
{
  return self->_HomePodDetected;
}

- (void)setHomePodDetected:(id)a3
{
  objc_storeStrong((id *)&self->_HomePodDetected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HomePodDetected, 0);
}

@end
