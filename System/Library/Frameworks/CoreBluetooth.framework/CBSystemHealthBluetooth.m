@implementation CBSystemHealthBluetooth

- (CBSystemHealthBluetooth)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Please use initWithComponentType"));

  return 0;
}

- (CBSystemHealthBluetooth)initWithComponentType:(unint64_t)a3
{
  CBSystemHealthBluetooth *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBSystemHealthBluetooth;
  result = -[CBSystemHealthBluetooth init](&v5, sel_init);
  if (result)
    result->componentType = a3;
  return result;
}

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;

  +[CBController controllerInfoAndReturnError:](CBController, "controllerInfoAndReturnError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastChipsetInitError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v8 = 2;
    goto LABEL_9;
  }
  if (a3)
    *a3 = (id)objc_msgSend(v5, "copy");
  v7 = objc_msgSend(v6, "code");
  v8 = 1;
  if (v7 > 310212)
  {
    if ((v7 - 310213) < 2)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (v7 != 310001)
LABEL_6:
    v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)componentType
{
  return self->componentType;
}

- (void)setComponentType:(unint64_t)a3
{
  self->componentType = a3;
}

@end
