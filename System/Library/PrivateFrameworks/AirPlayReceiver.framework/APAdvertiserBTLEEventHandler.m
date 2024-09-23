@implementation APAdvertiserBTLEEventHandler

void ___APAdvertiserBTLEEventHandler_block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  int v4;

  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
      v1 = *(_QWORD *)(a1 + 32);
      v2 = 1;
      goto LABEL_7;
    case 1:
      v1 = *(_QWORD *)(a1 + 32);
      v2 = 0;
LABEL_7:
      _APAdvertiserHandleSourceDeviceNearbyEvent(v1, v2);
      return;
    case 2:
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 1;
      goto LABEL_10;
    case 3:
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 0;
LABEL_10:
      _APAdvertiserSetNeedsNIRangingSession(v3, v4);
      break;
    default:
      if (gLogCategory_APAdvertiser <= 60
        && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
}

@end
