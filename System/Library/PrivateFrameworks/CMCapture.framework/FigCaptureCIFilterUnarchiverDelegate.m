@implementation FigCaptureCIFilterUnarchiverDelegate

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_50);
  return (id)sharedInstance_sSharedInstance;
}

FigCaptureCIFilterUnarchiverDelegate *__54__FigCaptureCIFilterUnarchiverDelegate_sharedInstance__block_invoke()
{
  FigCaptureCIFilterUnarchiverDelegate *result;

  result = objc_alloc_init(FigCaptureCIFilterUnarchiverDelegate);
  sharedInstance_sSharedInstance = (uint64_t)result;
  return result;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  if (!objc_msgSend(a5, "containsObject:", CFSTR("CIFilter")))
    return 0;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", a4);
  return (Class)objc_opt_class();
}

@end
