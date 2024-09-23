@implementation BBGetDeviceFamily

void __BBGetDeviceFamily_block_invoke()
{
  unsigned int v0;
  uint64_t v1;
  id v2;

  v2 = (id)MGCopyAnswer();
  v0 = objc_msgSend(v2, "integerValue") - 1;
  if (v0 > 5)
    v1 = -1;
  else
    v1 = qword_20CD37FE0[v0];
  BBGetDeviceFamily__deviceFamily = v1;

}

@end
