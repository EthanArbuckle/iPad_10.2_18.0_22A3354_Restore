@implementation C3DMeshElementPrintData

uint64_t __C3DMeshElementPrintData_block_invoke(uint64_t result, uint64_t a2, int *a3, unsigned int a4)
{
  uint64_t v4;
  FILE **v7;
  uint64_t v8;
  int v9;

  v4 = result;
  switch(*(_BYTE *)(result + 40))
  {
    case 0:
    case 1:
    case 5:
      result = fprintf((FILE *)*MEMORY[0x1E0C80C20], "%4u : %4u %4u %4u\n");
      break;
    case 2:
      result = fprintf((FILE *)*MEMORY[0x1E0C80C20], "%4u : %4u %4u\n");
      break;
    case 3:
      result = fprintf((FILE *)*MEMORY[0x1E0C80C20], "%4u : %4u\n");
      break;
    case 4:
      v7 = (FILE **)MEMORY[0x1E0C80C20];
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%2u : [Polygon %4u]", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24), a4);
      if (a4)
      {
        v8 = a4;
        do
        {
          v9 = *a3++;
          fprintf(*v7, " %4u", v9);
          --v8;
        }
        while (v8);
      }
      result = fputc(10, *v7);
      break;
    default:
      break;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24);
  return result;
}

@end
