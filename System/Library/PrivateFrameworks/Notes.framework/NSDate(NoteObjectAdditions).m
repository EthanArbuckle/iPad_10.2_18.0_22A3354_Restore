@implementation NSDate(NoteObjectAdditions)

+ (uint64_t)ic_modificationDateForNoteBeingEdited
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
