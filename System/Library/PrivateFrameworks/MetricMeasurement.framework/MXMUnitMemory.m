@implementation MXMUnitMemory

+ (MXMUnitMemory)bits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("bit"), v3);

  return v4;
}

+ (MXMUnitMemory)nibbles
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 4.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("nibble"), v3);

  return v4;
}

+ (MXMUnitMemory)bytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("byte"), v3);

  return v4;
}

+ (MXMUnitMemory)kilobits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("kb"), v3);

  return v4;
}

+ (MXMUnitMemory)kilobytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("kB"), v3);

  return v4;
}

+ (MXMUnitMemory)megabits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Mb"), v3);

  return v4;
}

+ (MXMUnitMemory)megabytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("MB"), v3);

  return v4;
}

+ (MXMUnitMemory)gigabits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Gb"), v3);

  return v4;
}

+ (MXMUnitMemory)gigabytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8000000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("GB"), v3);

  return v4;
}

+ (MXMUnitMemory)terabits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 9.99999996e11);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Tb"), v3);

  return v4;
}

+ (MXMUnitMemory)terabytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 7.99999997e12);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("TB"), v3);

  return v4;
}

+ (MXMUnitMemory)petabits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 9.99999987e14);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Pb"), v3);

  return v4;
}

+ (MXMUnitMemory)petabytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 7.9999999e15);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("PB"), v3);

  return v4;
}

+ (MXMUnitMemory)exabits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.00000003e16);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Eb"), v3);

  return v4;
}

+ (MXMUnitMemory)exabytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8.00000022e16);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("EB"), v3);

  return v4;
}

+ (MXMUnitMemory)kibibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1024.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Kib"), v3);

  return v4;
}

+ (MXMUnitMemory)kibibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8192.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("KiB"), v3);

  return v4;
}

+ (MXMUnitMemory)mebibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1048576.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Mib"), v3);

  return v4;
}

+ (MXMUnitMemory)mebibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8388608.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("MiB"), v3);

  return v4;
}

+ (MXMUnitMemory)gibibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1073741820.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Gib"), v3);

  return v4;
}

+ (MXMUnitMemory)gibibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8589934590.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("GiB"), v3);

  return v4;
}

+ (MXMUnitMemory)tebibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.09951163e12);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Tib"), v3);

  return v4;
}

+ (MXMUnitMemory)tebibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 8.79609302e12);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("TiB"), v3);

  return v4;
}

+ (MXMUnitMemory)pebibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.12589991e15);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Pib"), v3);

  return v4;
}

+ (MXMUnitMemory)pebibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 9.00719925e15);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("PiB"), v3);

  return v4;
}

+ (MXMUnitMemory)exbibits
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.1529215e18);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("Eib"), v3);

  return v4;
}

+ (MXMUnitMemory)exbibytes
{
  MXMUnitMemory *v2;
  void *v3;
  MXMUnitMemory *v4;

  v2 = [MXMUnitMemory alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 9.22337204e18);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("EiB"), v3);

  return v4;
}

@end
