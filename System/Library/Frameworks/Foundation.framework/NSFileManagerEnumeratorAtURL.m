@implementation NSFileManagerEnumeratorAtURL

uint64_t ____NSFileManagerEnumeratorAtURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;

  if (!a2 && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("NSURL")))
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("NSFilePath"));
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
