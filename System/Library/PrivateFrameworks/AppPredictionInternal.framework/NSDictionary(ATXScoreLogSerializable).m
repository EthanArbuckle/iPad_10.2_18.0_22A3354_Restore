@implementation NSDictionary(ATXScoreLogSerializable)

- (uint64_t)atx_writeToFile:()ATXScoreLogSerializable
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = (_QWORD *)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v6, 8 * v5);
  objc_msgSend(a1, "getObjects:andKeys:count:", 0, v6, v5);
  CFQSortArray();
  fwrite("{\n", 2uLL, 1uLL, a3);
  for (; v5; --v5)
  {
    objc_msgSend((id)*v6, "atx_writeToFile:", a3);
    fwrite(": ", 2uLL, 1uLL, a3);
    objc_msgSend(a1, "objectForKeyedSubscript:", *v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "atx_writeToFile:", a3);

    if (v5 != 1)
      fputc(44, a3);
    fputc(10, a3);
    ++v6;
  }
  return fputc(125, a3);
}

@end
