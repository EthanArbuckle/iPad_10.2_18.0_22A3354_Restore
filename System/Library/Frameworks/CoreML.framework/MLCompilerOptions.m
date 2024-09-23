@implementation MLCompilerOptions

- (MLCompilerOptions)init
{
  MLCompilerOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLCompilerOptions;
  result = -[MLCompilerOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_dryRun = 0;
    result->_allowsPixelBufferDirectBinding = 0;
  }
  return result;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)platformVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPlatformVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)containerIsCloud
{
  return self->_containerIsCloud;
}

- (void)setContainerIsCloud:(BOOL)a3
{
  self->_containerIsCloud = a3;
}

- (BOOL)trainWithMLCompute
{
  return self->_trainWithMLCompute;
}

- (void)setTrainWithMLCompute:(BOOL)a3
{
  self->_trainWithMLCompute = a3;
}

- (BOOL)allowsPixelBufferDirectBinding
{
  return self->_allowsPixelBufferDirectBinding;
}

- (void)setAllowsPixelBufferDirectBinding:(BOOL)a3
{
  self->_allowsPixelBufferDirectBinding = a3;
}

- (BOOL)encryptModel
{
  return self->_encryptModel;
}

- (void)setEncryptModel:(BOOL)a3
{
  self->_encryptModel = a3;
}

- (NSNumber)keyInfoVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyInfoVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)keyID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)usesCodeSigningIdentityForEncryption
{
  return self->_usesCodeSigningIdentityForEncryption;
}

- (void)setUsesCodeSigningIdentityForEncryption:(BOOL)a3
{
  self->_usesCodeSigningIdentityForEncryption = a3;
}

- (NSData)iv
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIv:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)sinf
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSinf:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSData)mlsinf
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMlsinf:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSURL)specURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSpecURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int)mlProgramAddDuringCompilationMode
{
  return self->_mlProgramAddDuringCompilationMode;
}

- (void)setMlProgramAddDuringCompilationMode:(int)a3
{
  self->_mlProgramAddDuringCompilationMode = a3;
}

- (BOOL)allowMultipleInputsWithEnumeratedShapes
{
  return self->_allowMultipleInputsWithEnumeratedShapes;
}

- (void)setAllowMultipleInputsWithEnumeratedShapes:(BOOL)a3
{
  self->_allowMultipleInputsWithEnumeratedShapes = a3;
}

- (NSMutableArray)warnings
{
  return self->_warnings;
}

- (void)setWarnings:(id)a3
{
  objc_storeStrong((id *)&self->_warnings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_specURL, 0);
  objc_storeStrong((id *)&self->_mlsinf, 0);
  objc_storeStrong((id *)&self->_sinf, 0);
  objc_storeStrong((id *)&self->_iv, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_keyInfoVersion, 0);
  objc_storeStrong((id *)&self->_platformVersion, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (id)defaultOptions
{
  return objc_alloc_init((Class)a1);
}

@end
