@implementation NSUnitInformationStorage

+ (void)initialize
{
  if (NSUnitInformationStorage == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitInformationStorage bytes](NSUnitInformationStorage, "bytes");
}

+ (id)icuType
{
  return CFSTR("digital");
}

+ (NSUnitInformationStorage)yottabytes
{
  return (NSUnitInformationStorage *)&yottabytes__struct_yottabytes;
}

+ (NSUnitInformationStorage)zettabytes
{
  return (NSUnitInformationStorage *)&zettabytes__struct_zettabytes;
}

+ (NSUnitInformationStorage)exabytes
{
  return (NSUnitInformationStorage *)&exabytes__struct_exabytes;
}

+ (NSUnitInformationStorage)petabytes
{
  return (NSUnitInformationStorage *)&petabytes__struct_petabytes;
}

+ (NSUnitInformationStorage)terabytes
{
  return (NSUnitInformationStorage *)&terabytes__struct_terabytes;
}

+ (NSUnitInformationStorage)gigabytes
{
  return (NSUnitInformationStorage *)&gigabytes__struct_gigabytes;
}

+ (NSUnitInformationStorage)megabytes
{
  return (NSUnitInformationStorage *)&megabytes__struct_megabytes;
}

+ (NSUnitInformationStorage)kilobytes
{
  return (NSUnitInformationStorage *)&kilobytes__struct_kilobytes;
}

+ (NSUnitInformationStorage)bytes
{
  return (NSUnitInformationStorage *)&bytes__struct_bytes;
}

+ (NSUnitInformationStorage)yobibytes
{
  return (NSUnitInformationStorage *)&yobibytes__struct_yobibytes;
}

+ (NSUnitInformationStorage)zebibytes
{
  return (NSUnitInformationStorage *)&zebibytes__struct_zebibytes;
}

+ (NSUnitInformationStorage)exbibytes
{
  return (NSUnitInformationStorage *)&exbibytes__struct_exbibytes;
}

+ (NSUnitInformationStorage)pebibytes
{
  return (NSUnitInformationStorage *)&pebibytes__struct_pebibytes;
}

+ (NSUnitInformationStorage)tebibytes
{
  return (NSUnitInformationStorage *)&tebibytes__struct_tebibytes;
}

+ (NSUnitInformationStorage)gibibytes
{
  return (NSUnitInformationStorage *)&gibibytes__struct_gibibytes;
}

+ (NSUnitInformationStorage)mebibytes
{
  return (NSUnitInformationStorage *)&mebibytes__struct_mebibytes;
}

+ (NSUnitInformationStorage)kibibytes
{
  return (NSUnitInformationStorage *)&kibibytes__struct_kibibytes;
}

+ (NSUnitInformationStorage)yottabits
{
  return (NSUnitInformationStorage *)&yottabits__struct_yottabits;
}

+ (NSUnitInformationStorage)zettabits
{
  return (NSUnitInformationStorage *)&zettabits__struct_zettabits;
}

+ (NSUnitInformationStorage)exabits
{
  return (NSUnitInformationStorage *)&exabits__struct_exabits;
}

+ (NSUnitInformationStorage)petabits
{
  return (NSUnitInformationStorage *)&petabits__struct_petabits;
}

+ (NSUnitInformationStorage)terabits
{
  return (NSUnitInformationStorage *)&terabits__struct_terabits;
}

+ (NSUnitInformationStorage)gigabits
{
  return (NSUnitInformationStorage *)&gigabits__struct_gigabits;
}

+ (NSUnitInformationStorage)megabits
{
  return (NSUnitInformationStorage *)&megabits__struct_megabits;
}

+ (NSUnitInformationStorage)kilobits
{
  return (NSUnitInformationStorage *)&kilobits__struct_kilobits;
}

+ (NSUnitInformationStorage)nibbles
{
  return (NSUnitInformationStorage *)&nibbles__struct_nibbles;
}

+ (NSUnitInformationStorage)bits
{
  return (NSUnitInformationStorage *)&bits__struct_bits;
}

+ (NSUnitInformationStorage)yobibits
{
  return (NSUnitInformationStorage *)&yobibits__struct_yobibits;
}

+ (NSUnitInformationStorage)zebibits
{
  return (NSUnitInformationStorage *)&zebibits__struct_zebibits;
}

+ (NSUnitInformationStorage)exbibits
{
  return (NSUnitInformationStorage *)&exbibits__struct_exbibits;
}

+ (NSUnitInformationStorage)pebibits
{
  return (NSUnitInformationStorage *)&pebibits__struct_pebibits;
}

+ (NSUnitInformationStorage)tebibits
{
  return (NSUnitInformationStorage *)&tebibits__struct_tebibits;
}

+ (NSUnitInformationStorage)gibibits
{
  return (NSUnitInformationStorage *)&gibibits__struct_gibibits;
}

+ (NSUnitInformationStorage)mebibits
{
  return (NSUnitInformationStorage *)&mebibits__struct_mebibits;
}

+ (NSUnitInformationStorage)kibibits
{
  return (NSUnitInformationStorage *)&kibibits__struct_kibibits;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  NSUnitConverter *v7;
  double v8;
  double v9;
  double v10;
  int v12;
  uint64_t v13;

  if (qword_1EDC54E88 != -1)
    dispatch_once(&qword_1EDC54E88, &__block_literal_global_700);
  v5 = objc_msgSend(a3, "unit");
  v6 = (void *)objc_msgSend(a3, "measurementByConvertingToUnit:", +[NSUnitInformationStorage bytes](NSUnitInformationStorage, "bytes"));
  v7 = -[NSDimension converter](+[NSUnitInformationStorage bytes](NSUnitInformationStorage, "bytes"), "converter");
  objc_msgSend(v6, "doubleValue");
  v9 = v8;
  -[NSUnitConverter coefficient](v7, "coefficient");
  if (a3 && v9 < v10)
    return a3;
  v12 = objc_msgSend((id)qword_1EDC54E80, "containsObject:", v5);
  if (v12)
    v13 = 1024;
  else
    v13 = 1000;
  return (id)__NSMeasurementConvertedForFileSizeDescription(a3, 0xFFFF, v12 ^ 1u, v13, 0);
}

uint64_t __64__NSUnitInformationStorage__measurementWithNaturalScale_system___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", +[NSUnitInformationStorage yobibytes](NSUnitInformationStorage, "yobibytes"), +[NSUnitInformationStorage yobibits](NSUnitInformationStorage, "yobibits"), +[NSUnitInformationStorage zebibytes](NSUnitInformationStorage, "zebibytes"), +[NSUnitInformationStorage zebibits](NSUnitInformationStorage, "zebibits"), +[NSUnitInformationStorage exbibytes](NSUnitInformationStorage, "exbibytes"), +[NSUnitInformationStorage exbibits](NSUnitInformationStorage, "exbibits"), +[NSUnitInformationStorage pebibytes](NSUnitInformationStorage, "pebibytes"), +[NSUnitInformationStorage pebibits](NSUnitInformationStorage, "pebibits"), +[NSUnitInformationStorage tebibytes](NSUnitInformationStorage, "tebibytes"), +[NSUnitInformationStorage tebibits](NSUnitInformationStorage, "tebibits"), +[NSUnitInformationStorage gibibytes](NSUnitInformationStorage, "gibibytes"), +[NSUnitInformationStorage gibibits](NSUnitInformationStorage, "gibibits"), +[NSUnitInformationStorage mebibytes](NSUnitInformationStorage, "mebibytes"), +[NSUnitInformationStorage mebibits](NSUnitInformationStorage, "mebibits"), +[NSUnitInformationStorage kibibytes](NSUnitInformationStorage, "kibibytes"), +[NSUnitInformationStorage kibibits](NSUnitInformationStorage, "kibibits"), 0);
  qword_1EDC54E80 = result;
  return result;
}

@end
