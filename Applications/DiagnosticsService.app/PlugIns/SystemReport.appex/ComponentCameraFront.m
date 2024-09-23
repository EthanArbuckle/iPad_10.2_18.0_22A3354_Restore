@implementation ComponentCameraFront

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentCameraFront;
  v4 = a3;
  -[ComponentCameraBase populateAttributes:](&v6, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentCameraFront isSuperWide](self, "isSuperWide", v6.receiver, v6.super_class)));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("isSuperWide"));

}

- (id)serialNumberComponentPropertyKey
{
  return CFSTR("FrontCameraModuleSerialNumString");
}

- (int64_t)cameraModuleType
{
  return 2;
}

- (BOOL)isSuperWide
{
  return MGGetBoolAnswer(CFSTR("fI93k3j19qMaEqYkKKI7BQ"), a2);
}

@end
