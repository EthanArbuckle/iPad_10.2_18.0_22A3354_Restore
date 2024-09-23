@implementation DESPFLEncryptor

- (DESPFLEncryptor)init
{
  DESPFLEncryptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DESPFLEncryptor;
  result = -[DESPFLEncryptor init](&v3, sel_init);
  if (result)
  {
    result->_version = 2;
    result->_weight = 1.0;
  }
  return result;
}

- (DESPFLEncryptor)initWithRecipeUserInfo:(id)a3
{
  return -[DESPFLEncryptor initWithRecipeUserInfo:writeToSubmissionLogs:](self, "initWithRecipeUserInfo:writeToSubmissionLogs:", a3, 1);
}

- (DESPFLEncryptor)initWithRecipe:(id)a3
{
  void *v4;
  DESPFLEncryptor *v5;

  objc_msgSend(a3, "recipeUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DESPFLEncryptor initWithRecipeUserInfo:writeToSubmissionLogs:](self, "initWithRecipeUserInfo:writeToSubmissionLogs:", v4, 1);

  return v5;
}

- (BOOL)pluginShouldAddNoiseAndEncryptResult
{
  id v2;

  v2 = DESLogAndReturnSunsetError();
  return 0;
}

+ (BOOL)privatizationSupported
{
  return 0;
}

- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 numbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptedAndPrivatizedDataWithPublicKey:(id)a3 inPlaceNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptAndPrivatizeDataWithRecipe:(id)a3 numbers:(float *)a4 count:(unint64_t)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  DESLogAndSetSunsetError(a7);
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 dataNumbers:(const double *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 dataFloatNumbers:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataNumbers:(double *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 inPlaceDataFloatNumbers:(float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 data:(id)a4 error:(id *)a5
{
  DESLogAndSetSunsetError(a5);
  return 0;
}

- (NSString)privatizationIdentifier
{
  return self->_privatizationIdentifier;
}

- (void)setPrivatizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatizationIdentifier, 0);
}

@end
