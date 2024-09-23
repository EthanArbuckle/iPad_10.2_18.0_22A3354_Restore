@implementation _DPHCMSSequenceMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("HCMSSequence"));
}

@end
