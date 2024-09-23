@implementation JUScreenClassGetMain

void __JUScreenClassGetMain_block_invoke()
{
  int v0;
  uint64_t v1;
  BOOL v2;
  void *v3;
  void *v4;
  int v5;

  v0 = MGGetSInt32Answer() + 1;
  v1 = 0;
  switch(v0)
  {
    case 0:
      break;
    case 4:
    case 5:
    case 7:
    case 8:
      v1 = 7;
      break;
    case 6:
      v1 = 1;
      break;
    case 9:
      if (JUScreenClassGetMainIsZoomed_onceToken != -1)
        dispatch_once(&JUScreenClassGetMainIsZoomed_onceToken, &__block_literal_global_12_0);
      v2 = JUScreenClassGetMainIsZoomed_isZoomed == 0;
      v1 = 1;
      goto LABEL_11;
    case 10:
    case 11:
      if (JUScreenClassGetMainIsZoomed_onceToken != -1)
        dispatch_once(&JUScreenClassGetMainIsZoomed_onceToken, &__block_literal_global_12_0);
      v2 = JUScreenClassGetMainIsZoomed_isZoomed == 0;
      v1 = 2;
LABEL_11:
      if (v2)
        ++v1;
      break;
    case 12:
      v5 = MGGetSInt32Answer();
      v1 = 9;
      if (v5 == 2)
        v1 = 11;
      break;
    case 13:
      v1 = 13;
      break;
    case 14:
      v1 = 12;
      break;
    case 15:
      v1 = 8;
      break;
    case 16:
      v1 = 4;
      break;
    case 17:
      v1 = 14;
      break;
    case 18:
      v1 = 15;
      break;
    case 19:
      v1 = 6;
      break;
    case 20:
      v1 = 5;
      break;
    case 21:
      v1 = 10;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JUScreenClass JUScreenClassGetMain(void)_block_invoke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("JUScreenClass.m"), 165, CFSTR("Unsupported screen class"));

      v1 = 0;
      break;
  }
  JUScreenClassGetMain_mainScreenClass = v1;
}

@end
