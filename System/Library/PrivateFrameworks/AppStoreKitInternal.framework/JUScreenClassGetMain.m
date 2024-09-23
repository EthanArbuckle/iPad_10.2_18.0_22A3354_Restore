@implementation JUScreenClassGetMain

void __JUScreenClassGetMain_block_invoke()
{
  int v0;
  uint64_t v1;
  BOOL v2;
  int v3;

  v0 = MGGetSInt32Answer();
  v1 = 0;
  switch(v0)
  {
    case 3:
    case 4:
    case 6:
    case 7:
    case 30:
    case 31:
      v1 = 7;
      break;
    case 5:
      v1 = 1;
      break;
    case 8:
      if (JUScreenClassGetMainIsZoomed_onceToken != -1)
        dispatch_once(&JUScreenClassGetMainIsZoomed_onceToken, &__block_literal_global_7);
      v2 = JUScreenClassGetMainIsZoomed_isZoomed == 0;
      v1 = 1;
      goto LABEL_12;
    case 9:
    case 10:
      if (JUScreenClassGetMainIsZoomed_onceToken != -1)
        dispatch_once(&JUScreenClassGetMainIsZoomed_onceToken, &__block_literal_global_7);
      v2 = JUScreenClassGetMainIsZoomed_isZoomed == 0;
      v1 = 2;
LABEL_12:
      if (v2)
        ++v1;
      break;
    case 11:
      v3 = MGGetSInt32Answer();
      v1 = 9;
      if (v3 == 2)
        v1 = 11;
      break;
    case 12:
      v1 = 13;
      break;
    case 13:
      v1 = 12;
      break;
    case 14:
      v1 = 8;
      break;
    case 15:
    case 22:
      v1 = 4;
      break;
    case 16:
      v1 = 14;
      break;
    case 17:
      v1 = 15;
      break;
    case 18:
      v1 = 6;
      break;
    case 19:
      v1 = 5;
      break;
    case 20:
      v1 = 10;
      break;
    case 21:
    case 23:
      v1 = 16;
      break;
    case 24:
      v1 = 19;
      break;
    case 25:
      v1 = 20;
      break;
    case 28:
      v1 = 18;
      break;
    case 32:
      v1 = 23;
      break;
    case 33:
      v1 = 24;
      break;
    default:
      break;
  }
  JUScreenClassGetMain_mainScreenClass = v1;
}

@end
