@implementation CGSVGPathCreateWithCGPath

void __CGSVGPathCreateWithCGPath_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  SVGPathCommand *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  __int128 v10;
  void *__p;
  void *v12;
  _OWORD *v13;
  CGPoint v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      v4 = (SVGPathCommand *)operator new();
      SVGPathCommand::SVGPathCommand(v4, 77);
      goto LABEL_9;
    case 1:
      v4 = (SVGPathCommand *)operator new();
      SVGPathCommand::SVGPathCommand(v4, 76);
LABEL_9:
      SVGPathCommand::appendPoint(v4, *(CGPoint *)v3);
      goto LABEL_10;
    case 2:
      v5 = *(_OWORD *)(v3 + 16);
      v14 = *(CGPoint *)v3;
      v15 = v5;
      v6 = operator new(0x20uLL);
      v12 = v6 + 2;
      v13 = v6 + 2;
      v7 = v15;
      *v6 = v14;
      v6[1] = v7;
      __p = v6;
      v4 = (SVGPathCommand *)operator new();
      SVGPathCommand::SVGPathCommand(v4, 81);
      SVGPathCommand::appendPoints((uint64_t)v4, (_QWORD **)&__p);
      goto LABEL_5;
    case 3:
      v8 = *(_OWORD *)(v3 + 16);
      v14 = *(CGPoint *)v3;
      v15 = v8;
      v16 = *(_OWORD *)(v3 + 32);
      v9 = operator new(0x30uLL);
      v12 = v9 + 3;
      v13 = v9 + 3;
      v10 = v15;
      *v9 = v14;
      v9[1] = v10;
      v9[2] = v16;
      __p = v9;
      v4 = (SVGPathCommand *)operator new();
      SVGPathCommand::SVGPathCommand(v4, 67);
      SVGPathCommand::appendPoints((uint64_t)v4, (_QWORD **)&__p);
LABEL_5:
      if (__p)
      {
        v12 = __p;
        operator delete(__p);
      }
      goto LABEL_10;
    case 4:
      v4 = (SVGPathCommand *)operator new();
      SVGPathCommand::SVGPathCommand(v4, 90);
LABEL_10:
      SVGPath::addCommand(*(SVGPath **)(a1 + 32), v4);
      CFRetained::release((CFTypeRef *)v4);
      break;
    default:
      return;
  }
}

@end
