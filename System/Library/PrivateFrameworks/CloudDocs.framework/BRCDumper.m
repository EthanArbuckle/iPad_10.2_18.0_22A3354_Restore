@implementation BRCDumper

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  return &stru_1E3DA8AC8;
}

- (id)stringForReset
{
  return &stru_1E3DA8AC8;
}

- (void)startFgColor:(int)a3 attr:(int)a4
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 9, *(_QWORD *)&a4);
}

- (void)startBgColor:(int)a3 attr:(int)a4
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)startFgColor:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 9, 0);
}

- (void)startBgColor:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, *(_QWORD *)&a3, 0);
}

- (void)startAttributes:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, 9, *(_QWORD *)&a3);
}

- (void)changeFgColor:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

- (void)changeBgColor:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

- (void)changeAttributes:(int)a3
{
  -[BRCDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

@end
